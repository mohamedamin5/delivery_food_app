import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';

class Ondoarding extends StatefulWidget {
  const Ondoarding({super.key});

  @override
  State<Ondoarding> createState() => _OndoardingState();
}

class _OndoardingState extends State<Ondoarding> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appLocalizations = AppLocalizations.of(context)!;
    List<String> titles = [
      appLocalizations.translate("onboarding_title_1"),
      appLocalizations.translate("onboarding_title_2"),
      appLocalizations.translate("onboarding_title_3"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: pageController,
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(color: Colors.grey, height: 292, width: 240),
                      SizedBox(height: 50),
                      Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        appLocalizations.translate("onboarding_description"),
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? Color(0xFFFF7622)
                          : Color(0xFFFFE1CE),
                      shape: BoxShape.circle,
                    ),
                  );
                },
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),

            SizedBox(
              width: size.width * 0.872,
              child: AppButton(
                text: currentPage == 2
                    ? appLocalizations.translate("button_get_started")
                    : appLocalizations.translate("button_next"),
                onTap: () {
                  if (currentPage == 2) {
                    Navigator.pushReplacementNamed(context, "/login");
                  } else {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                height: 62,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text(
                appLocalizations.translate("button_skip"),
                style: TextStyle(color: Color(0xFF646982)),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
