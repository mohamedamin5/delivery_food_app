import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return SizedBox(
      width: 62.w,
      height: 64.h,
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return appLocalizations.translate('error_enter_digit');
          }
          if (value.length > 1) {
            return appLocalizations.translate('error_only_one_digit_allowed');
          }
          if (!RegExp(r'^[0-9]$').hasMatch(value)) {
            return appLocalizations.translate('error_only_digits_allowed');
          }
          return null;
        },
        controller: controller,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        maxLength: 1,
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.backgroundLight,
          counterText: '',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
      ),
    );
  }
}
