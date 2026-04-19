import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDraggableSheet extends StatelessWidget {
  final List<Widget> children;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

  const AppDraggableSheet({
    super.key,
    required this.children,
    this.initialChildSize = 0.3,
    this.minChildSize = 0.2,
    this.maxChildSize = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Container(
                width: 70.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(80.r),
                ),
              ),
              SizedBox(height: 29.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  controller: scrollController,
                  children: children,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
