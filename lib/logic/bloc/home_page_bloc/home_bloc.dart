import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeEvent>((event, emit) {
      return emit.forEach<HomeState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error',
              name: 'AuthtBloc', error: error, stackTrace: stackTrace);
          return ErrorHomeState(error.toString());
        },
      );
    });
  }
}
