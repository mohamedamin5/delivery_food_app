import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCardItem extends StatelessWidget {
  final String cardType;
  final String fullCardNumber; // نمرر الرقم كاملاً هنا
  final String cardIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentCardItem({
    super.key,
    required this.cardType,
    required this.fullCardNumber,
    required this.cardIcon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // منطق الاستقطاع: نأخذ آخر 3 أرقام فقط
    // إذا كان الرقم أقل من 3 أرقام سيعطي الكود خطأ، لذا نضع حماية
    String lastThreeDigits = fullCardNumber.length >= 3
        ? fullCardNumber.substring(fullCardNumber.length - 3)
        : fullCardNumber;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(15.r),
          border: isSelected
              ? Border.all(color: Colors.orange, width: 2)
              : null,
        ),
        child: Row(
          children: [
            Image.asset(cardIcon, width: 45.w),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardType,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "**** **** **** $lastThreeDigits", // هنا ندمج النجوم مع الـ 3 أرقام
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
