import 'package:flutter/material.dart';
import 'package:flutter_application_2/approute.dart';
import 'package:flutter_application_2/core/id/service_locator.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/core/data/data_source/secure_storage_data_sourceImpl.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_bloc.dart';

import 'package:flutter_application_2/screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  final localeBloc = LocaleBloc();
  localeBloc.add(LoadSystemLocaleEvent());
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<LocaleBloc>(create: (context) => localeBloc)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) => MaterialApp(
            onGenerateRoute: Approute().onGenerateRoute,
            supportedLocales: [const Locale('en'), const Locale('ar')],
            locale: state.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: BlocProvider(
              create: (context) =>
                  SplashBloc(locator<SecureStorageDataSourceImpl>()),
              child: Splashscreen(),
            ),
          ),
        );
      },
    );
  }
}
