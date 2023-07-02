import 'dart:async';
import 'dart:developer' as developer;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:phsps_api_work/logic/repository/repository.dart';
import 'home_bloc.dart';
import 'home_state.dart';

@immutable
abstract class HomeEvent extends Equatable {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class LoadMainEvent extends HomeEvent {
  final Repository authRepository;
  LoadMainEvent(this.authRepository);

  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield const HomeLoadingState();
      var data = await authRepository.fetchData();
      if (data == null) {
        yield ErrorHomeState('An unknown error occured'.toString());
      }
      yield HomeDoneState(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}
