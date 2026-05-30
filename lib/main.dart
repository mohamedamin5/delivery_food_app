import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/navigation/approute.dart';
import 'package:flutter_application_2/core/id/service_locator.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/bloc/blocs_imports.dart';

import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String host = "127.0.0.1";
  FirebaseStorage.instance.useStorageEmulator(host, 9199);
  final localeBloc = LocaleBloc();
  localeBloc.add(LoadSystemLocaleEvent());
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<LocaleBloc>(create: (context) => localeBloc)],
      child: const MyApp(),
    ),
  );
  await setupLocator();
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
            initialRoute: "/",
            onGenerateRoute: Approute().onGenerateRoute,
            supportedLocales: [const Locale('en'), const Locale('ar')],
            locale: state.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
