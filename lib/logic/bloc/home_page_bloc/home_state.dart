import 'package:equatable/equatable.dart';

import '../../../model/dashboard_data_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

/// initialized
class HomeInitState extends HomeState {
  const HomeInitState();
}

/// initialized
class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

/// Initialized
class HomeDoneState extends HomeState {
  const HomeDoneState(this.user);

  final List<CustomerDataModel>? user;

  @override
  List<Object> get props => [user!];
}

class ErrorHomeState extends HomeState {
  const ErrorHomeState(this.errorMessage);

  final String? errorMessage;

  @override
  List<Object> get props => [errorMessage!];
}
