import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/cart/screens/cart_screen.dart';
import 'package:flutter_application_2/features/Home/presentation/screens/home_screen.dart';
import 'package:flutter_application_2/features/profile/screens/profile_screen.dart';
import 'package:flutter_application_2/features/Home/presentation/screens/search_screen.dart';
import 'package:flutter_application_2/features/sitting/screens/sittings_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currntitem = 2;
  List<Widget> screens = [
    SearchScreen(),
    CartScreen(),
    HomeScreen(),
    ProfileScreen(),
    SittingsScreen(),
  ];
  List<Map> itmes = [
    {"icon": Icons.search, "label": "Search"},
    {"icon": Icons.shopping_cart, "label": "Cart"},
    {"icon": Icons.home_outlined, "label": "Home"},
    {"icon": Icons.account_circle_outlined, "label": "Profile"},
    {"icon": Icons.settings, "label": "Settings"},
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Column(
          children: [
            Expanded(child: screens[currntitem]),

            Container(
              height: size.height * 0.086,
              width: size.width,
              decoration: const BoxDecoration(color: Color(0xFFFF7622)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: itmes.asMap().entries.map<Widget>((entry) {
                  int index = entry.key;
                  var item = entry.value;
                  return SizedBox(
                    width: size.width * 0.15,
                    child: GestureDetector(
                      onTap: () {
                        currntitem = index;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: currntitem == index ? Colors.white : null,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item["icon"],
                              color: currntitem == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            Text(
                              item["label"],
                              style: TextStyle(
                                color: currntitem == index
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
