import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsps_api_work/global/constants.dart';
import 'package:phsps_api_work/logic/bloc/index.dart';
import 'package:phsps_api_work/presentation/auth/components/login_page.dart';
import 'package:phsps_api_work/presentation/auth/components/reg_page.dart';
import '../../drawer/drawer.dart';

class AuthtScreen extends StatefulWidget {
  const AuthtScreen({
    Key? key,
   
  })  :
        super(key: key);


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
    return BlocBuilder<AuthBloc, AuthState>(
        // bloc: widget._authBloc,
        builder: (BuildContext context, AuthState currentState) {
          if (currentState is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (currentState is ErrorAuthtState) {
            return const SizedBox.shrink();
          }

          if (currentState is AuthDoneState) {
            Navigator.pushNamed(context, DrawerWidget.routeName);
          }

          if (currentState is AuthInitState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: (Constants.size(context).width / 5),
                      child: !isLogin
                          ? RegisterForm(
                             )
                          : LoginForm(
                              
                            )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(isLogin ? 'Register' : 'Login'))
                ],
              ),
            );
          }
          return const Center(
            child: Text('initializing...'),
          );
        });
  }

  void _load() {}
}
