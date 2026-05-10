import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/app_text_field.dart';
import 'package:flutter_application_2/core/widget/custom_arroe_back_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Image.asset('assets/images/Ellipse 1005.png'),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          appLocalizations.translate('verification_title'),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          appLocalizations.translate(
                            'verification_description',
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xFFFFFFFF),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    left: 10.w,
                    child: CustomArroeBackIcon(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: 579.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Text(appLocalizations.translate('hint_email')),
                      SizedBox(height: 10.h),
                      AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: "example@example.com",
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return appLocalizations.translate(
                              'error_email_empty',
                            );
                          }
                          if (!RegExp(
                            r'^[^@]+@[^@]+\.[^@]+$',
                          ).hasMatch(value)) {
                            return appLocalizations.translate(
                              'error_email_invalid',
                            );
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.h),

                      SizedBox(height: 40.h),
                      AppButton(
                        text: appLocalizations.translate('button_send_code'),
                        onTap: () {
                          Navigator.pushNamed(context, "/verification");
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
    );
  }
}
