import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/app_text_field.dart';
import 'package:flutter_application_2/features/Auth/logic/aut_event.dart';
import 'package:flutter_application_2/features/Auth/logic/auth_bloc.dart';
import 'package:flutter_application_2/features/Auth/logic/auth_state.dart';
import 'package:flutter_application_2/features/splashscreens/logic/splash_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 7,
                backgroundColor: AppColors.dark,
                color: AppColors.primary,
                strokeCap: StrokeCap.round,
              ),
            ),
          );
        } else if (state is AuthSeccess) {
          Navigator.pop(context);
          if (state.role == UserRole.chef) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/sellerdashboard",
              (r) => false,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
          }
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          print("Login error: ${state.error}");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E2E),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(
                  appLocalizations.translate('login_title'),
                  appLocalizations.translate('login_description'),
                ),
                _buildSignUpForm(appLocalizations),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String loginText, String loginDescription) {
    return Container(
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
            loginText,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            loginDescription,
            style: TextStyle(fontSize: 16.sp, color: const Color(0xFFFFFFFF)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xFFA0A5BA), // نفس اللون الرمادي في التصميم
      ),
    );
  }

  Widget _buildSignUpForm(AppLocalizations appLocalizations) {
    return Form(
      key: formKey,
      child: Container(
        height: 579.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              _buildFieldLabel(appLocalizations.translate('hint_email')),
              SizedBox(height: 10.h),
              AppTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: "example@example.com",
                controller: emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return appLocalizations.translate('error_email_empty');
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return appLocalizations.translate('error_email_invalid');
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),
              _buildFieldLabel(appLocalizations.translate('hint_password')),
              SizedBox(height: 10.h),
              AppTextField(
                keyboardType: TextInputType.text,
                hintText: "********",
                isPassword: true,
                controller: passwordController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return appLocalizations.translate('error_password_empty');
                  }
                  if (value.length < 6) {
                    return appLocalizations.translate('error_password_short');
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: isChecked, onChanged: (t) {}),
                      _buildFieldLabel(
                        appLocalizations.translate('text_remember_me'),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/forgot_password");
                    },
                    child: Text(
                      appLocalizations.translate('text_forgot_password'),
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              AppButton(
                text: appLocalizations.translate('button_login'),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                      LoginRequested(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  }
                },
                height: 62.h,
              ),
              SizedBox(height: 20.h),
              _buildLoginRedirect(appLocalizations),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginRedirect(AppLocalizations appLocalizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(appLocalizations.translate('text_dont_have_account')),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/signup");
          },
          child: Text(
            appLocalizations.translate('button_signup'),
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
