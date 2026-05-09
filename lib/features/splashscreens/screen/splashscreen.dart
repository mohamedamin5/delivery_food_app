import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs_imports.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_bloc.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_event.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    context.read<SplashBloc>().add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is FirstTimeUsage) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/onboarding",
            (r) => false,
          );
        } else if (state is Unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
        } else if (state is Authenticated) {
          Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/Ellipse 1005.png",
                  alignment: Alignment.topLeft,
                ),
              ),
              SizedBox(height: 200),
              Image.asset(
                "assets/images/Logo.png",
                alignment: Alignment.center,
              ),
              SizedBox(height: 220),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/images/Ellipse 1006.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
