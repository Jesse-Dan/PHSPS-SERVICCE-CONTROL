// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'components/auth_screen.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/auth.screen';
 

  const AuthPage(
      {super.key, });

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthtScreen(
       
      ),
    );
  }
}
