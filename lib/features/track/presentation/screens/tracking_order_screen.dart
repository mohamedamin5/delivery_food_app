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
              bgColor: AppColors.mainBackground,
              icon: Icon(Icons.arrow_back_ios_new),
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
              Container(color: Colors.white, height: 100.h, width: 100.w),
            ],
          ),
        ],
      ),
    );
  }
}
