import 'dart:ui';
import 'package:flutter_application_2/core/providers/localprovider/locale_event.dart';
import 'package:flutter_application_2/core/providers/localprovider/locale_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleSet(Locale('en'))) {
    on<LoadSystemLocaleEvent>((event, emit) {
      final systemLocale = PlatformDispatcher.instance.locale;
      emit(LocaleSet(Locale(systemLocale.languageCode)));
    });

    on<ChangeLocaleEvent>((event, emit) {
      emit(LocaleSet(Locale(event.localeCode)));
    });
  }
}
