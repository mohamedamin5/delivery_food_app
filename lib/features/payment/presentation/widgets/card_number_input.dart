import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/card_number_formatter.dart'; // مسار الـ formatter

class CardNumberInput extends StatelessWidget {
  const CardNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CARD NUMBER",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFA0A5BA),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF0F5FA),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberFormatter(),
            ],
            decoration: InputDecoration(
              hintText: "2134  ____  ____  ____",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 18.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
