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

class CostumerEvent extends HomeEvent {
  final Repository authRepository;
  CostumerEvent(this.authRepository);

  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield const HomeLoadingState();
      var data = await authRepository.fetchData();
      if (data == null) {
        yield ErrorHomeState('An unknown error occured'.toString());
      }
      yield CostumerDone(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}

class SingleCostumerEvent extends HomeEvent {
  final Repository authRepository;
  final String? query;
  SingleCostumerEvent(this.authRepository, {this.query});

  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield const HomeLoadingState();
      var data = await authRepository.fetchSingelDataData(query: query);
      if (data == null) {
        yield ErrorHomeState('An unknown error occured'.toString());
      }
      yield SingleCostumerDone(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}

class SearchEvent extends HomeEvent {
  final Repository authRepository;
  final String? query;

  SearchEvent(this.authRepository, {this.query});

  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield const HomeLoadingState();
      var data = await authRepository.searchData(query: query);
      if (data == null) {
        yield ErrorHomeState('An unknown error occured'.toString());
      }
      yield CostumerDone(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}

class MonthEvent extends HomeEvent {
  final Repository authRepository;
  final String? query;

  MonthEvent(this.authRepository, {this.query});

  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield const HomeLoadingState();
      var data = await authRepository.searchMonthData(month: query);
      if (data == null) {
        yield ErrorHomeState('An unknown error occured'.toString());
      }
      yield CostumerDone(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}

class SumEvent extends HomeEvent {
  final Repository authRepository;
  final String? query;

  SumEvent(this.authRepository, {this.query});

  @override
  Stream<HomeState> applyAsync(
      {HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield const HomeLoadingState();
      var data = await authRepository.searchSumData(month: query);
      if (data == null) {
        yield ErrorHomeState('An unknown error occured'.toString());
      }
      yield CostumerDone(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadMainEvent', error: _, stackTrace: stackTrace);
      yield ErrorHomeState(_.toString());
    }
  }

  @override
  List<Object?> get props => [];
}
