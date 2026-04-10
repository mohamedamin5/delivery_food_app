import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/onboarding');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Image.asset("assets/images/Logo.png", alignment: Alignment.center),
            SizedBox(height: 220),
            Container(
              alignment: Alignment.bottomRight,
              child: Image.asset("assets/images/Ellipse 1006.png"),
            ),
          ],
        ),
      ),
    );
  }
}
