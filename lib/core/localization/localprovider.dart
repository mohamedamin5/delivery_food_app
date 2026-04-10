
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;


final localeprovider = StateProvider<Locale>((ref) {
  final systemlocale = PlatformDispatcher.instance.locale;
  return systemlocale;
});