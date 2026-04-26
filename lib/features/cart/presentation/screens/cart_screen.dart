import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final applocalizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.dark,
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
                      _buildTopAppBar(applocalizations!),
                      SizedBox(height: 24.h),
                      Expanded(child: _buildCartList(applocalizations)),
                    ],
                  ),
                ),
              ),
              _buildFooter(applocalizations),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopAppBar(AppLocalizations applocalizations) {
    return Row(
      children: [
        Row(
          children: [
            CustomCircleButton(
              size: 45,
              bgColor: AppColors.dark,
              icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(width: 18.w),
            Text(
              applocalizations.translate("Text_cart"),
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            applocalizations.translate("text_edit_items"),
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

  Widget _buildCartItem(AppLocalizations applocalizations) {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.greyText,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                applocalizations.translate("Text_item_name"),
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

  Widget _buildCartList(AppLocalizations applocalizations) {
    return ListView.builder(
      itemCount: 5, // عدد العناصر في الكارت
      itemBuilder: (context, index) => _buildCartItem(applocalizations),
    );
  }

  Widget _buildFooter(AppLocalizations applocalizations) {
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
                  applocalizations.translate("Text_delivery_address"),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    applocalizations.translate("text_edit"),
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
            _buildAddressField(applocalizations),
            SizedBox(height: 30.h),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      applocalizations.translate("text_total"),
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
                  applocalizations.translate("text_breakdown"),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            AppButton(
              text: applocalizations.translate("text_place_order"),
              onTap: () {},
              height: 62.h,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressField(AppLocalizations applocalizations) {
    return TextField(
      decoration: InputDecoration(
        hintText: applocalizations.translate("hint_enter_delivery_address"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
