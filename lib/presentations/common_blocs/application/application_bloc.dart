import 'dart:ui';

import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/presentations/common_blocs/common_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/language/language_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<SetupApplication>((event, emit) {
      final oldLanguage = Boxes.getSettings().get(Setting.language.name);

      if (oldLanguage != null) {
        CommonBloc.languageBloc.add(LanguageChanged(Locale(oldLanguage)));
      }

      /// Authentication begin check
      // CommonBloc.authencationBloc.add(AuthenticationStarted());

      emit(ApplicationCompleted());
    });
  }
}
