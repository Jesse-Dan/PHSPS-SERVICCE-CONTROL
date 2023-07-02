import 'dart:async';
import 'dart:developer' as developer;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:phsps_api_work/logic/bloc/index.dart';
import 'package:phsps_api_work/logic/repository/repository.dart';
import 'package:phsps_api_work/model/sign_up_model.dart';

import '../../../model/sign_in_model.dart';
import '../../../model/user_model.dart';

@immutable
abstract class AuthEvent extends Equatable {
  Stream<AuthState> applyAsync({AuthState currentState, AuthBloc bloc});
}

class LoginEvent extends AuthEvent {
  final SignInModel signinData;
  final Repository authRepository;

  LoginEvent({required this.authRepository, required this.signinData});
  @override
  Stream<AuthState> applyAsync(
      {AuthState? currentState, AuthBloc? bloc}) async* {
    try {
      yield const AuthLoadingState();
      UserModel? data = await authRepository.login(signinData: signinData);
      if (data == null) {
        yield ErrorAuthtState(
            'An error occured while performing operation'.toString());
      } else {
        yield AuthDoneState(data);
      }
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthtState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final SignUpModel signUpData;
  final Repository authRepository;

  RegisterEvent({required this.signUpData, required this.authRepository});
  @override
  Stream<AuthState> applyAsync(
      {AuthState? currentState, AuthBloc? bloc}) async* {
    try {
      yield const AuthLoadingState();
      UserModel? data =
          await authRepository.createAccount(signUpData: signUpData);
      if (data == null) {
        yield ErrorAuthtState(
            'An error occured while performing operation'.toString());
      } else {
        yield AuthDoneState(data);
      }
    } catch (_, stackTrace) {
      developer.log('$_', name: 'RegEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthtState(_.toString());
    }
  }

  @override
  List<Object?> get props => [signUpData];
}
