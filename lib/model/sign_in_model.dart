// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final String email;
  final String password;

  SignInModel({required this.email,required this.password});
  
  @override
  List<Object?> get props => [email,password];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInModel.fromJson(String source) => SignInModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
