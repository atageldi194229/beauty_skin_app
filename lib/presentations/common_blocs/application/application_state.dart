part of 'application_bloc.dart';

@immutable
abstract class ApplicationState {}

@immutable
class ApplicationInitial extends ApplicationState {}

@immutable
class ApplicationCompleted extends ApplicationState {}
