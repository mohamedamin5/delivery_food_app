import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter_application_2/features/track/presentation/widgets/courier_info_card.dart';

class TrackingOrderScreen extends StatefulWidget {
  const TrackingOrderScreen({super.key});

  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderScreenState();
}

class _TrackingOrderScreenState extends State<TrackingOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 24.w,
            child: CustomCircleButton(
              size: 45,
              bgColor: AppColors.dark,
              icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
            ),
          ),

          Container(
            alignment: Alignment.center,
            child: Text(
              'Tracking Order Screen',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ),
          AppDraggableSheet(
            children: [
              _buildOrderHeader(),
              SizedBox(height: 29.h),
              _buildDeliveryEstimation(),
              SizedBox(height: 36.5.h),
              _buildOrderTimeline(),
              SizedBox(height: 30.h),
              _buildCourierCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Row(
      children: [
        Container(
          width: 63.w,
          height: 53.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          children: [
            Text(
              "Uttora Coffee House",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 10.w),
            Text(
              "Orderd at 06 Sept, 10:00pm",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryEstimation() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          "20 min",
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          "Estimated delivery time",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildOrderTimeline() {
    return Column(
      children: [
        Row(
          children: [
            CustomCircleButton(
              size: 17,
              bgColor: AppColors.greyText,
              icon: Icon(Icons.check, size: 15.sp),
            ),
            SizedBox(width: 12.82.w),
            Text(
              "Your order has been received",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            CustomCircleButton(
              size: 17,
              bgColor: AppColors.greyText,
              icon: Icon(Icons.check, size: 15.sp),
            ),
            SizedBox(width: 12.82.w),
            Text(
              "The restaurant is preparing your food",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            CustomCircleButton(
              size: 17,
              bgColor: AppColors.greyText,
              icon: Icon(Icons.check, size: 15.sp),
            ),
            SizedBox(width: 12.82.w),
            Text(
              "Your order has been picked up for delivery",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            CustomCircleButton(
              size: 17,
              bgColor: AppColors.greyText,
              icon: Icon(Icons.check, size: 15.sp),
            ),
            SizedBox(width: 12.82.w),
            Text(
              "Order arriving soon!",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCourierCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      height: 116.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCircleButton(
            bgColor: AppColors.greyText,
            icon: SizedBox.shrink(),
            size: 54,
          ),
          SizedBox(width: 11.w),
          Column(
            children: [
              Text(
                "Robert F.",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Courier",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyText,
                ),
              ),
            ],
          ),
          SizedBox(width: 50.w),
          CustomCircleButton(
            bgColor: AppColors.primary,
            icon: Icon(Icons.call_outlined, color: AppColors.white),
            size: 45,
          ),
          SizedBox(width: 15.w),
          CustomCircleButton(
            bgColor: AppColors.white,
            icon: Icon(Icons.message_outlined, color: AppColors.primary),
            size: 45,
          ),
        ],
      ),
    );
  }
}
