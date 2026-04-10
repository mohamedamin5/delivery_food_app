import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/customcirclebutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SizedBox(
                  height: 502.h,
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      _buildTopAppBar(),
                      SizedBox(height: 24.h),
                      Expanded(child: _buildCartList()),
                    ],
                  ),
                ),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Row(
      children: [
        Row(
          children: [
            CustomCircleButton(
              size: 45,
              bgColor: AppColors.cardBackground,
              icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(width: 18.w),
            Text(
              'Cart',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'EDIT ITEMS',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem() {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.mainBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Item Name',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '\$9.99',
                style: TextStyle(fontSize: 14.sp, color: AppColors.primary),
              ),
            ],
          ),
          const Spacer(),
          CustomCircleButton(
            size: 32,
            bgColor: AppColors.primary,
            icon: Icon(Icons.add, color: Colors.white, size: 20.sp),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      itemCount: 5, // عدد العناصر في الكارت
      itemBuilder: (context, index) => _buildCartItem(),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 310.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Delivery ADDRESS',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'EDIT',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            _buildAddressField(),
            SizedBox(height: 30.h),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      'TOTAL:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '\$49.95',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const Spacer(),
                Text(
                  'breakdown >',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            AppButton(text: "Place ORder", onTap: () {}, height: 62.h),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter delivery address',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
