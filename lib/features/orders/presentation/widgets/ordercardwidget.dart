import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';

class Ordercardwidget extends StatelessWidget {
  const Ordercardwidget({
    super.key,
    required this.orderStatus,
    required this.onTap,
    required this.onTap2,
  });
  final String orderStatus;
  final void Function()? onTap;
  final void Function()? onTap2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("status"),
          SizedBox(height: 32.h),
          Row(
            children: [
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.greyText,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              SizedBox(width: 14.w),
              const Column(
                children: [
                  Text(
                    "Food name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Food price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    switch (orderStatus) {
      case "completed":
        return _rowLayout(primaryLabel: "Re-Order", secondaryLabel: "Rate");
      case "ordering":
        return _rowLayout(
          primaryLabel: "Track Order",
          secondaryLabel: "Cancel",
          isDestructive: true,
        );
      case "canceled":
        return _rowLayout(
          primaryLabel: "Re-Order",
          secondaryLabel: null, // لا يوجد تقييم للملغي
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _rowLayout({
    required String primaryLabel,
    String? secondaryLabel,
    bool isDestructive = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: _customButton(onTap: onTap, text: primaryLabel),
        ),
        if (secondaryLabel != null) ...[
          SizedBox(width: 16.w),
          Expanded(
            child: _customButton(
              onTap: onTap2,
              text: secondaryLabel,
              isPrimary: !isDestructive,
            ),
          ),
        ],
      ],
    );
  }

  Widget _customButton({
    required void Function()? onTap,
    required String text,
    bool isPrimary = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38.h,
        width: 139.w,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : AppColors.white,
          border: Border.all(width: 1, color: AppColors.primary),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? AppColors.white : AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
