import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/customcirclebutton.dart';
import 'package:flutter_application_2/core/widget/paymentcarditem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            _buildAppBar(context),
            SizedBox(height: 30.h),
            PaymentCardItem(
              cardType: "Mastercard",
              fullCardNumber: "1234123456789089",
              cardIcon: "assets/images/mastercard.png",
              isSelected: true,
              onTap: () {
                // Handle card selection
              },
            ),

            SizedBox(height: 15.h),
            _buildAddCardButton(),
            const Spacer(),
            _buildCheckoutSection(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        CustomCircleButton(
          size: 45,
          bgColor: AppColors.cardBackground,
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.black,
            size: 20.sp,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 18.w),
        Text(
          "Payment",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryAction,
          ),
        ),
      ],
    );
  }

  Widget _buildAddCardButton() {
    return Container(
      height: 62.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white,
        border: Border.all(color: Color(0xFFF0F5FA), width: 2.w),
      ),
      child: Center(
        child: Text(
          "+ Add New Card",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Total: :",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA0A5BA),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "89\$",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 28.h),
        AppButton(text: 'Pay & Confirm', onTap: () {}, height: 62.h),
      ],
    );
  }
}
