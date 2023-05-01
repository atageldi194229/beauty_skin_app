part of 'language_bloc.dart';

@immutable
abstract class LanguageState {}

@immutable
class LanguageInitial extends LanguageState {}

@immutable
class LanguageUpdating extends LanguageState {}

@immutable
class LanguageUpdated extends LanguageState {}
