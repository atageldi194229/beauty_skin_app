part of 'application_bloc.dart';

@immutable
abstract class ApplicationEvent {}

@immutable
class SetupApplication extends ApplicationEvent {}
