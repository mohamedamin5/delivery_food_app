import 'package:flutter_application_2/features/Home/logic/home_bloc/home_bloc_import.dart';
import 'package:flutter_application_2/screens.dart';
import 'package:flutter/material.dart';

class Approute {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc(),
            child: HomeScreen(),
          ),
        );
      case "/signup":
        return MaterialPageRoute(builder: (context) => const SingUpScreen());
      case "/login":
        return MaterialPageRoute(builder: (context) => const Loginscreen());
      case "/onboarding":
        return MaterialPageRoute(builder: (context) => const Ondoarding());
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
      default:
        return null;
    }
  }
}
