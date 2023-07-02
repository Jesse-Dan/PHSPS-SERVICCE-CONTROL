// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsps_api_work/logic/bloc/index.dart';
import '../../../model/sign_up_model.dart';

class RegisterForm extends StatefulWidget {
  static const String routeName = '/auth.registration';

  const RegisterForm({
    Key? key,
   
  })  :
        super(key: key);


  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Register'),
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              // Add additional name validation if needed
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
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
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
                      signUpData: SignUpModel(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text),
                      authRepository:RepositoryProvider.of(context)));
                }
              },
              child: const Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
