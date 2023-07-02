import 'package:equatable/equatable.dart';

import '../../../model/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// initialized
class AuthInitState extends AuthState {
  const AuthInitState();
}

/// initialized
class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

/// Initialized
class AuthDoneState extends AuthState {
  const AuthDoneState(this.user);

  final UserModel? user;

  @override
  List<Object> get props => [user!];
}

/// Initialized
class LoadDoneDoneState extends AuthState {
  const LoadDoneDoneState(this.hello);

  final String hello;

  @override
  List<Object> get props => [hello];
}

class ErrorAuthtState extends AuthState {
  const ErrorAuthtState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
