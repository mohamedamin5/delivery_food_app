import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/app_button.dart';
import 'package:flutter_application_2/core/widget/app_text_field.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';

class ChefRestaurantSetupScreen extends StatefulWidget {
  const ChefRestaurantSetupScreen({super.key});

  @override
  State<ChefRestaurantSetupScreen> createState() =>
      _ChefRestaurantSetupScreenState();
}

class _ChefRestaurantSetupScreenState extends State<ChefRestaurantSetupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _restaurantNameController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  File? _restaurantImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _restaurantImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _restaurantNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(appLocalizations),
              _buildSetupForm(appLocalizations),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations appLocalizations) {
    return Container(
      height: 200.h,
      width: double.infinity,
      color: const Color(0xFF1E1E2E),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appLocalizations.translate('setup_restaurant_title'),
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              appLocalizations.translate('setup_restaurant_desc'),
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFFA0A5BA)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSetupForm(AppLocalizations appLocalizations) {
    return Form(
      key: _formKey,
      child: Container(
        height: 600.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              // Restaurant Image Picker
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      Container(
                        width: 130.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF4F5F7),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                          image: _restaurantImage != null
                              ? DecorationImage(
                                  image: FileImage(_restaurantImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _restaurantImage == null
                            ? Icon(
                                Icons.storefront_outlined,
                                size: 50.sp,
                                color: const Color(0xFFA0A5BA),
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 5.w,
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),

              // Restaurant Name Field
              _buildFieldLabel(
                appLocalizations.translate('hint_restaurant_name'),
              ),
              SizedBox(height: 8.h),
              AppTextField(
                keyboardType: TextInputType.text,
                hintText: "e.g. Chef Ahmed's Kitchen",
                controller: _restaurantNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your restaurant name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              // Restaurant Description Field
              _buildFieldLabel(
                appLocalizations.translate('hint_restaurant_desc'),
              ),
              SizedBox(height: 8.h),
              AppTextField(
                keyboardType: TextInputType.multiline,
                hintText:
                    "Tell customers about your special dishes, fresh ingredients, and what makes your kitchen unique...",
                controller: _descriptionController,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a description";
                  }
                  if (value.trim().length < 20) {
                    return "Description is too short. Write at least 20 characters.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40.h),

              // Submit Button
              AppButton(
                text: appLocalizations.translate('button_save'),

                onTap: () {
                  if (_restaurantImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please select a restaurant image first!",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    // Execute your Bloc Event here:
                    // context.read<RestaurantBloc>().add(CreateRestaurantRequested(...));
                  }
                },
                height: 60.h,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFA0A5BA),
      ),
    );
  }
}
