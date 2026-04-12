import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/core/providers/localprovider/locale_event.dart';
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
            routes: {
              "/addcardscreen": (context) => const AddCardScreen(),
              "/paymentscreen": (context) => const PaymentScreen(),
              "/cartscreen": (context) => const CartScreen(),
              "/productDetails": (context) => const ProductDetails(),
              "/restaurantDetails": (context) => const ResterabtDetails(),
              "/login": (context) => const Loginscreen(),
              "/onboarding": (context) => const Ondoarding(),
              "/forgot_password": (context) => const ForgotPasswordScreen(),
              "/verification": (context) => const VerificationScreen(),
              "/signup": (context) => const SingUpScreen(),
              "/categorie": (context) => const CategoryProductsScreen(),
              "/home": (context) => const HomeScreen(),
            },
            supportedLocales: [const Locale('en'), const Locale('ar')],
            locale: state.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            theme: ThemeData(primarySwatch: Colors.blue),
            home: const Loginscreen(),
          ),
        );
      },
    );
  }
}
