import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/navigation/approute.dart';
import 'package:flutter_application_2/core/id/service_locator.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source_impl.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_bloc.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String host = "192.168.0.125";
  await FirebaseAuth.instance.useAuthEmulator(host, 9099);
  FirebaseStorage.instance.useStorageEmulator(host, 9199);
  final localeBloc = LocaleBloc();
  localeBloc.add(LoadSystemLocaleEvent());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(create: (context) => localeBloc),

        BlocProvider(
          create: (context) => SplashBloc(
            locator<AuthLocalDataSourceImpl>(),
            locator<AppLocalDataSourceImpl>(),
          ),
        ),
      ],
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
  final GlobalKey<NavigatorState> navigatoinkey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> snackbarkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<SplashBloc, SplashState>(
              listener: (context, state) {
                if (state is FirstTimeUsage) {
                  navigatoinkey.currentState!.pushNamedAndRemoveUntil(
                    "/onboarding",
                    (r) => false,
                  );
                } else if (state is Unauthenticated) {
                  navigatoinkey.currentState!.pushNamedAndRemoveUntil(
                    "/login",
                    (r) => false,
                  );
                } else if (state is Authenticated) {
                  if (state.role == UserRole.chef) {
                    navigatoinkey.currentState!.pushNamedAndRemoveUntil(
                      "/sellerdashboard",
                      (r) => false,
                    );
                  } else {
                    navigatoinkey.currentState!.pushNamedAndRemoveUntil(
                      "/home",
                      (r) => false,
                    );
                  }
                }
              },
            ),
          ],
          child: BlocBuilder<LocaleBloc, LocaleState>(
            builder: (context, state) => MaterialApp(
              navigatorKey: navigatoinkey,
              scaffoldMessengerKey: snackbarkey,
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
          ),
        );
      },
    );
  }
}
