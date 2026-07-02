import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(appLocalizations),
              SizedBox(height: 30.h),

              // Summary Statistics
              Row(
                children: [
                  _buildSummaryCard(
                    appLocalizations.translate("text_running_orders"),
                    "20",
                  ),
                  SizedBox(width: 15.w),
                  _buildSummaryCard(
                    appLocalizations.translate("text_order_request"),
                    "05",
                  ),
                ],
              ),
              SizedBox(height: 25.h),

              // Revenue Section (Empty Chart Container)
              _buildRevenueCard(appLocalizations),
              SizedBox(height: 25.h),

              // Reviews Section
              _buildReviewsCard(appLocalizations),
              SizedBox(height: 25.h),

              // Popular Items Section
              _buildPopularItemsSection(appLocalizations),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addfooditempage");
        },
        backgroundColor: AppColors.white,
        shape: CircleBorder(
          side: BorderSide(color: AppColors.primary, width: 1.5.w),
        ),
        elevation: 2,
        child: Icon(Icons.add, color: AppColors.primary, size: 35.sp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader(AppLocalizations appLocalizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.short_text, size: 30.sp),
        ),
        Column(
          children: [
            Text(
              appLocalizations.translate("text_location"),
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                letterSpacing: 1.2,
              ),
            ),
            Row(
              children: [
                Text(
                  "Halal Lab office",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Color(0xFF2D3142),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: AppColors.dark),
              ],
            ),
          ],
        ),
        CircleAvatar(backgroundColor: Color(0xFFA0B2C1), radius: 25.r),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.dark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                color: Color(0xFF9EA3AE),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(AppLocalizations appLocalizations) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalizations.translate("text_total_revenue"),
                    style: TextStyle(color: Color(0xFF9EA3AE), fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "\$2,241",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      appLocalizations.translate("button_see_details"),
                      style: const TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          appLocalizations.translate("text_daily"),
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 18.sp,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Empty Container for Chart as requested
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              // Placeholder styling
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsCard(AppLocalizations appLocalizations) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizations.translate("text_reviews"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Color(0xFF2D3142),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  appLocalizations.translate("button_see_all_reviews"),
                  style: const TextStyle(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.primary, size: 32.sp),
              SizedBox(width: 8.w),
              Text(
                "4.9",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                appLocalizations.translate("text_total_reviews"),
                style: TextStyle(color: Color(0xFF9EA3AE), fontSize: 15.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItemsSection(AppLocalizations appLocalizations) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appLocalizations.translate("text_popular_items_this_weeks"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: Color(0xFF2D3142),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                appLocalizations.translate("button_see_all"),
                style: const TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            _itemPlaceholder(),
            SizedBox(width: 15.w),
            _itemPlaceholder(),
          ],
        ),
      ],
    );
  }

  Widget _itemPlaceholder() {
    return Expanded(
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: const Color(0xFFA0B2C1),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: 70.h,
      notchMargin: 10.w,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.grid_view_rounded,
              color: AppColors.primary,
              size: 28.sp,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFFD0D3D8), size: 28.sp),
            onPressed: () {},
          ),
          SizedBox(width: 40.w),
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Color(0xFFD0D3D8),
              size: 28.sp,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person_outline_rounded,
              color: Color(0xFFD0D3D8),
              size: 28.sp,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/chefprofile");
            },
          ),
        ],
      ),
    );
  }
}
