import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:phsps_api_work/logic/bloc/index.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState) {
    on<AuthEvent>((event, emit) {
      return emit.forEach<AuthState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'AuthtBloc', error: error, stackTrace: stackTrace);
          return ErrorAuthtState(error.toString());
        },
      );
    });
  }
}
