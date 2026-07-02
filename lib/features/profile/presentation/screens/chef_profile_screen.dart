import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs_imports.dart';

import 'package:flutter_application_2/features/profile/presentation/widget/profile_menu_item.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_bloc.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_event.dart';

class ChefProfileScreen extends StatelessWidget {
  const ChefProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الجزء العلوي البرتقالي (Header)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 30,
                left: 24,
                right: 24,
              ),
              decoration: const BoxDecoration(
                color: Color(0xffff7622),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // سطر العنوان وزر الرجوع
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // تفاصيل الرصيد
                  const Text(
                    "Available Balance",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "\$500.00",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // زر السحب (Withdraw)
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Withdraw",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // قائمة العناصر (Menu List)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: "Personal Info",
                    onTap: () {
                      Navigator.pushNamed(context, "/editrestaurantpage");
                    },
                    color: Color(0xffff7622),
                  ),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    icon: Icons.settings_outlined,

                    title: "Settings",
                    onTap: () {},
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    icon: Icons.credit_card_outlined,
                    title: "Withdrawal History",
                    onTap: () {},
                    color: Color(0xffff7622),
                  ),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    icon: Icons.receipt_long_outlined,
                    title: "Number of Orders",
                    color: Colors.cyan,
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    icon: Icons.grid_view_outlined,

                    title: "User Reviews",
                    onTap: () {},
                    color: Colors.teal,
                  ),
                  SizedBox(height: 16),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: "Log Out",
                    onTap: () {
                      context.read<SplashBloc>().add(LogoutRequested());
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
