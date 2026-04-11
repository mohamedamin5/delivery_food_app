import 'package:equatable/equatable.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

class LoadSystemLocaleEvent extends LocaleEvent {
  const LoadSystemLocaleEvent();
}

class ChangeLocaleEvent extends LocaleEvent {
  const ChangeLocaleEvent(this.localeCode);
  final String localeCode;

  @override
  List<Object?> get props => [localeCode];
}
