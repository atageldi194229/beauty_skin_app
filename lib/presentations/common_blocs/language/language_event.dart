part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent extends Equatable {}

@immutable
class LanguageChanged extends LanguageEvent {
  final Locale locale;

  LanguageChanged(this.locale);

  @override
  List<Object> get props => [locale];
}
