// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String name;

  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  List<Object?> get props => [name, email, password, confirmPassword];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
