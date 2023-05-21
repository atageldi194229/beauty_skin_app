import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/localization/language.dart';
import 'package:flutter/material.dart' show immutable, Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageChanged>((event, emit) async {
      if (event.locale == AppLanguage.defaultLanguage) {
        emit(LanguageUpdated());
      } else {
        emit(LanguageUpdating());
        AppLanguage.defaultLanguage = event.locale;

        // save in storage
        await Boxes.getSettings().put(
          Setting.language.name,
          event.locale.languageCode,
        );

        emit(LanguageUpdated());
      }
    });
  }
}
