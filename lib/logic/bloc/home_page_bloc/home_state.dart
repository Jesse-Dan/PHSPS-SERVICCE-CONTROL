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

/// Loading
class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

/// Error
class ErrorHomeState extends HomeState {
  const ErrorHomeState(this.errorMessage);

  final String? errorMessage;

  @override
  List<Object> get props => [errorMessage!];
}

/// All Done States
class CostumerDone extends HomeState {
  const CostumerDone(this.user);

  final List<CustomerDataModel>? user;

  @override
  List<Object> get props => [user!];
}

/// Initialized
class SingleCostumerDone extends HomeState {
  const SingleCostumerDone(this.user);

  final CustomerDataModel user;

  @override
  List<Object> get props => [user];
}
