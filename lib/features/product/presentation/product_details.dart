import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';

import 'package:flutter_application_2/core/widget/customcirclebutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.w),
                      Row(
                        children: [
                          CustomCircleButton(
                            size: 45,
                            bgColor: AppColors.greyText,
                            icon: Icon(Icons.arrow_back_ios_new),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 12),
                          Text("Details"),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        height: 184.h,
                        width: 327.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        height: 47.h,
                        width: 201.w,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.w),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Uttora Coffe House",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Pizza Calzone European',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        'Prosciutto e funghi is a pizza variety that is topped with tomato sauce.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 20.25.h),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.delivery_dining,
                                color: Color(0xFFFF7622),
                              ),
                              Text('Free'),
                            ],
                          ),
                          SizedBox(width: 36.w),
                          Row(
                            children: [
                              Icon(Icons.star_border, color: Color(0xFFFF7622)),
                              Text('4.7'),
                            ],
                          ),
                          SizedBox(width: 36.w),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Color(0xFFFF7622),
                              ),
                              Text(' 20 min'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24.75.h),
                      Row(
                        children: [
                          Text(
                            'SIZE:',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13.sp,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Container(
                            alignment: Alignment.center,
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF0F5FA),
                            ),
                            child: Text(
                              '10”',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),

                          Container(
                            alignment: Alignment.center,
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF0F5FA),
                            ),
                            child: Text(
                              '14”',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            alignment: Alignment.center,
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF0F5FA),
                            ),
                            child: Text(
                              '16”',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.69.h),
                      Text(
                        "INGRIDENTS",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 19.29.h),
                      Row(
                        children: [
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFEBE4),
                            ),
                          ),
                          SizedBox(width: 19.w),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFEBE4),
                            ),
                          ),
                          SizedBox(width: 19.w),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFEBE4),
                            ),
                          ),
                          SizedBox(width: 19.w),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFEBE4),
                            ),
                          ),
                          SizedBox(width: 19.w),
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFEBE4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 184.h,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$32',
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 156.w),
                      Container(
                        width: 125.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Color(0xFF121223),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_circle_sharp,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20.w),
                            Text('2', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 20.w),
                            Icon(Icons.add_circle, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  AppButton(text: 'ADD TO CART', onTap: () {}, height: 62.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
