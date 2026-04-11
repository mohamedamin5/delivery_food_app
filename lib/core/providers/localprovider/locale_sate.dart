import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState(this.locale);

  @override
  List<Object?> get props => [];
}

class LocaleSet extends LocaleState {
  const LocaleSet(super.locale);
}
