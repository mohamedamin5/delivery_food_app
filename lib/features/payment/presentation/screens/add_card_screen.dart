import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widget/customcirclebutton.dart';
import '../widgets/card_number_input.dart'; // الملف الذي شرحناه سابقاً

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildAppBar(context),
              SizedBox(height: 30.h),

              // 1. حقل اسم صاحب البطاقة
              _buildLabel("CARD HOLDER NAME"),
              _buildCustomTextField(hint: "Vishal Khadok"),

              SizedBox(height: 24.h),

              // 2. حقل رقم البطاقة (الذي فصلناه في ملف مستقل)
              const CardNumberInput(),

              SizedBox(height: 24.h),

              // 3. صف التاريخ والـ CVC
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("EXPIRE DATE"),
                        _buildCustomTextField(hint: "mm/yyyy"),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("CVC"),
                        _buildCustomTextField(hint: "***"),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppButton(text: 'Add & Make Payment', onTap: () {}, height: 62.h),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }

  // دالة مساعدة للـ Label لتقليل التكرار
  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFA0A5BA),
        ),
      ),
    );
  }

  // دالة بناء الـ TextField العام (للاسم والتاريخ)
  Widget _buildCustomTextField({required String hint}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color(0xFF32343E).withValues(alpha: 0.5),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 18.h,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        CustomCircleButton(
          size: 45,
          bgColor: const Color(0xFFF0F5FA),
          icon: const Icon(Icons.close, color: Colors.black, size: 20),
          onTap: () => Navigator.pop(context),
        ),
        SizedBox(width: 16.w),
        Text(
          "Add Card",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF32343E),
          ),
        ),
      ],
    );
  }
}
