import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter_application_2/features/profile/presentation/widget/profile_menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 50.h),
                _buildAppBar(),
                SizedBox(height: 30.h),
                _buildProfileHeader(),
                SizedBox(height: 20.h),
                _buildAccountSettingsGroup(),
                SizedBox(height: 20.h),
                _buildOrderManagementGroup(),
                SizedBox(height: 20.h),
                _buildSupportAndSettingsGroup(),
                SizedBox(height: 20.h),
                _buildLogoutSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        CustomCircleButton(
          bgColor: AppColors.greyText,
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.black),
        ),
        SizedBox(width: 16.w),
        Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CustomCircleButton(
          bgColor: AppColors.greyText,
          icon: SizedBox.shrink(),
        ),
        SizedBox(width: 32.w),
        Column(
          children: [
            Text(
              "John Doe",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            Text(
              "  @johndoe",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountSettingsGroup() {
    return Column(
      children: [
        ProfileMenuItem(
          color: Color(0xFFFB6F3D),
          title: "Personal Info",
          icon: Icons.person_outline,
          onTap: () {},
        ),
        ProfileMenuItem(
          color: Color(0xFF413DFB),
          title: "Addresses",
          icon: Icons.map_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildOrderManagementGroup() {
    return Column(
      children: [
        ProfileMenuItem(
          color: Color(0xFF369BFF),
          title: "Cart",
          icon: Icons.shopping_bag_outlined,
          onTap: () {},
        ),
        ProfileMenuItem(
          color: Color(0xFFB33DFB),
          title: "Favourite",
          icon: Icons.favorite_border,
          onTap: () {},
        ),
        ProfileMenuItem(
          color: Color(0xFFFFAA2A),
          title: "Notifications",
          icon: Icons.notifications_none,
          onTap: () {},
        ),
        ProfileMenuItem(
          color: Color(0xFF369BFF),
          title: "Payment Method",
          icon: Icons.credit_card_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSupportAndSettingsGroup() {
    return Column(
      children: [
        ProfileMenuItem(
          color: Color(0xFFFB6D3A),
          title: "FAQs",
          icon: Icons.help_outline,
          onTap: () {},
        ),
        ProfileMenuItem(
          color: Color(0xFF2AE1E1),
          title: "User Reviews",
          icon: Icons.rate_review_outlined,
          onTap: () {},
        ),
        ProfileMenuItem(
          color: Color(0xFF413DFB),
          title: "Settings",
          icon: Icons.settings_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLogoutSection() {
    return ProfileMenuItem(
      color: Color(0xFFFB4A59),
      title: "Logout",
      icon: Icons.logout_outlined,
      onTap: () {},
    );
  }
}
