import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsps_api_work/global/constants.dart';
import 'package:phsps_api_work/logic/bloc/index.dart';
import 'package:phsps_api_work/presentation/auth/components/login_page.dart';
import 'package:phsps_api_work/presentation/auth/components/reg_page.dart';
import 'package:phsps_api_work/presentation/widgets/overlay_manager.dart';
import '../../drawer/drawer.dart';

class AuthtScreen extends StatefulWidget {
  const AuthtScreen({
    Key? key,
  }) : super(key: key);

  @override
  AuthtScreenState createState() {
    return AuthtScreenState();
  }
}

class AuthtScreenState extends State<AuthtScreen> {
  AuthtScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthLoadingState) {
        OverlayService.showLoading(
            child: const Center(child: CircularProgressIndicator()));
      }

      if (state is! AuthLoadingState) {
        OverlayService.closeToasts();
      }

      if (state is ErrorAuthtState) {
        OverlayService.closeToasts();
        OverlayService.showToast(
            onDone: () {
              OverlayService.cancelFunc!.call();
            },
            onCancel: () {
              OverlayService.cancelFunc!.call();
            },
            title: 'Autorization Error',
            content: state.errorMessage);
      }

      if (state is AuthDoneState) {
        Navigator.pushNamed(context, DrawerWidget.routeName);
      }
    }, listenWhen: (previous, current) {
      if (current is ErrorAuthtState ||
          current is AuthLoadingState ||
          current is AuthDoneState) {
        return true;
      } else {
        return false;
      }
    }, buildWhen: (previous, current) {
      if (current is AuthInitState) {
        return true;
      } else {
        return false;
      }
    },
        // bloc: widget._authBloc,
        builder: (BuildContext context, AuthState currentState) {
      return _buildForms(context);
    });
  }

  Center _buildForms(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: (Constants.size(context).width / 2),
              child: !isLogin ? const RegisterForm() : const LoginForm()),
          TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(isLogin ? 'Register' : 'Login'),
              ))
        ],
      ),
    );
  }

  void _load() {}
}
