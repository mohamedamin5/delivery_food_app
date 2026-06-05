import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/data/data_source/app_local_data_source_impl.dart';
import 'package:flutter_application_2/core/id/service_locator.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source_impl.dart';
import 'package:flutter_application_2/features/Auth/data/repositories/auth_repository.dart';
import 'package:flutter_application_2/features/Auth/logic/auth_bloc.dart';
import 'package:flutter_application_2/features/Home/logic/home_bloc/home_bloc_import.dart';
import 'package:flutter_application_2/core/navigation/screens.dart';
import 'package:flutter_application_2/features/add_new_item/logic/bloc.dart';
import 'package:flutter_application_2/features/add_new_item/data/repositories/repository.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_bloc.dart';

class Approute {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashBloc(
              locator<AuthLocalDataSourceImpl>(),
              locator<AppLocalDataSourceImpl>(),
            ),
            child: Splashscreen(),
          ),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc(),
            child: const HomeScreen(),
          ),
        );
      case "/signup":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(locator<AuthRepository>()),
            child: const SingUpScreen(),
          ),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(locator<AuthRepository>()),
            child: const Loginscreen(),
          ),
        );
      case "/onboarding":
        return MaterialPageRoute(
          builder: (context) => Ondoarding(locator<AppLocalDataSourceImpl>()),
        );
      case "/forgot_password":
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        );
      case "/verification":
        return MaterialPageRoute(
          builder: (context) => const VerificationScreen(),
        );
      case "/addcardscreen":
        return MaterialPageRoute(builder: (context) => const AddCardScreen());
      case "/paymentscreen":
        return MaterialPageRoute(builder: (context) => const PaymentScreen());
      case "/cartscreen":
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case "/productDetails":
        return MaterialPageRoute(builder: (context) => const ProductDetails());
      case "/restaurantDetails":
        return MaterialPageRoute(
          builder: (context) => const ResterabtDetails(),
        );
      case "/categorie":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc(),
            child: CategoryProductsScreen(),
          ),
        );
      case "/addfooditempage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AddNewItemBloc(locator<AddItemRepository>()),
            child: AddFoodItemPage(),
          ),
        );
      case "/editrestaurantpage":
        return MaterialPageRoute(
          builder: (context) => const RestaurantProfileEditor(),
        );
      case "/sellerdashboard":
        return MaterialPageRoute(builder: (context) => const SellerDashboard());
      default:
        return null;
    }
  }
}
