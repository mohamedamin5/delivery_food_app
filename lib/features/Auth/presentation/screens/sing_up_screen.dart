import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/bloc/blocs_imports.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/app_text_field.dart';
import 'package:flutter_application_2/core/widget/custom_arroe_back_icon.dart';
import 'package:flutter_application_2/features/Auth/presentation/bloc/aut_event.dart';
import 'package:flutter_application_2/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_2/features/Auth/presentation/bloc/auth_state.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  void onTap() {
    context.read<AuthBloc>().add(
      RegisterRequested(
        nameController.text,
        passwordController.text,
        emailController.text,
        phoneNumber.text,
      ),
    );
  }

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
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 7,
                  backgroundColor: AppColors.dark,
                  color: AppColors.primary,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
          );
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.dark,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(appLocalizations)),
              SliverToBoxAdapter(child: _buildSignUpForm(appLocalizations)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations appLocalizations) {
    return Stack(
      children: [
        Container(
          height: 233.h,
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColors.dark),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/Ellipse 1005.png'),
              ),
              SizedBox(height: 20.h),
              Text(
                appLocalizations.translate('signup_title'),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                appLocalizations.translate('signup_description'),
                style: TextStyle(fontSize: 16.sp, color: AppColors.white),
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
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
      child: Text(label),
    );
  }

  Widget _buildSignUpForm(AppLocalizations appLocalizations) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            _buildFieldLabel(appLocalizations.translate('hint_name')),
            SizedBox(height: 10.h),
            AppTextField(
              controller: nameController,
              hintText: "John Doe",
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return appLocalizations.translate('error_name_empty');
                }
                return null;
              },
            ),
            SizedBox(height: 8.h),
            _buildFieldLabel(appLocalizations.translate('hint_email')),
            SizedBox(height: 10.h),
            AppTextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              hintText: "example@example.com",
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
            _buildFieldLabel(
              appLocalizations.translate('hint_retype_password'),
            ),
            SizedBox(height: 10.h),
            AppTextField(
              keyboardType: TextInputType.phone,
              controller: phoneNumber,
              hintText: "phone number",
              validator: (String? value) {
                return null;
              },
            ),
            SizedBox(height: 8.h),
            _buildFieldLabel(appLocalizations.translate('hint_password')),
            SizedBox(height: 10.h),

            AppTextField(
              controller: passwordController,
              hintText: "********",
              isPassword: true,
              keyboardType: TextInputType.text,
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

            SizedBox(height: 40.h),
            AppButton(
              text: appLocalizations.translate('button_signup'),
              onTap: onTap,
              height: 62.h,
            ),
            SizedBox(height: 20.h),
            _buildLoginRedirect(appLocalizations),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginRedirect(AppLocalizations appLocalizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(appLocalizations.translate('text_already_have_account')),
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/login");
          },
          child: Text(
            appLocalizations.translate('button_login'),
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
