import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/customcirclebutton.dart';
import 'package:flutter_application_2/core/widget/otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 233.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Color(0xFF1E1E2E)),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/Ellipse 1005.png',
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            appLocalizations.translate('verification_title'),
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            appLocalizations.translate(
                              'verification_description',
                            ),
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xFFFFFFFF),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    _buildArrowBackButton(),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Text(appLocalizations.translate('hint_email')),
                        SizedBox(height: 10.h),
                        _buildOTPFields(),
                        SizedBox(height: 40.h),
                        AppButton(
                          text: appLocalizations.translate('verify'),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/reset_password');
                            }
                          },
                          height: 62.h,
                        ),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArrowBackButton() {
    return Positioned(
      top: 40.h,
      left: 10.h,
      child: CustomCircleButton(
        bgColor: AppColors.backgroundLight,
        icon: Icon(Icons.arrow_back, color: AppColors.black),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildOTPFields() {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OtpTextField(
            controller: _controllers[0],
            focusNode: _focusNodes[0],
            nextFocusNode: _focusNodes[1],
          ),
          OtpTextField(
            controller: _controllers[1],
            focusNode: _focusNodes[1],
            nextFocusNode: _focusNodes[2],
          ),
          OtpTextField(
            controller: _controllers[2],
            focusNode: _focusNodes[2],
            nextFocusNode: _focusNodes[3],
          ),
          OtpTextField(controller: _controllers[3], focusNode: _focusNodes[3]),
        ],
      ),
    );
  }
}
