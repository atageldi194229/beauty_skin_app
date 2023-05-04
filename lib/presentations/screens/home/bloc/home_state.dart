part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

/// Initial
class HomeInitial extends HomeState {}

/// Loading
class HomeLoading extends HomeState {}

/// Adready data
class HomeLoaded extends HomeState {
  final HomeResponse homeResponse;

  const HomeLoaded({required this.homeResponse});

  @override
  List<Object> get props => [homeResponse];
}

/// Failure
class HomeLoadFailure extends HomeState {
  final String error;

  const HomeLoadFailure(this.error);
}
