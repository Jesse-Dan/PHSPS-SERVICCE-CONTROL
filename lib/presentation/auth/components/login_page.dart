// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:phsps_api_work/logic/bloc/index.dart';
import 'package:phsps_api_work/logic/repository/repository.dart';
import 'package:phsps_api_work/model/sign_in_model.dart';

class LoginForm extends StatefulWidget {
  static const String routeName = '/auth.login';

  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Login'),
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              // Add additional email validation if needed
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              // Add additional password validation if needed
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                      signinData: SignInModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                      authRepository:
                          RepositoryProvider.of<Repository>(context)));
                }
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
