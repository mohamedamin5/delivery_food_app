import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter_application_2/core/utils/file_path_utils.dart';
import 'package:flutter_application_2/features/Home/listrest.dart';
import 'package:image_picker/image_picker.dart';

class AddFoodItemPage extends StatefulWidget {
  const AddFoodItemPage({super.key});

  @override
  State<AddFoodItemPage> createState() => _AddFoodItemPageState();
}

class _AddFoodItemPageState extends State<AddFoodItemPage> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  final _formKey = GlobalKey<FormState>();

  // Controllers correspond to FoodItemCreate model
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int? selectedCategoryId;

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          appLocalizations.translate("button_add_new_item"),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Picker Placeholder
              Center(
                child: GestureDetector(
                  onTap: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                    // Handle the selected image
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: 40.sp,
                                color: Color(0xFFFF7622),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                appLocalizations.translate(
                                  "text_add_item_image",
                                ),
                              ),
                            ],
                          )
                        : Image.file(File(image!.path), fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              _buildLabel(appLocalizations.translate("Text_item_name")),
              _buildTextField(appLocalizations, nameController, Icons.fastfood),

              _buildLabel(appLocalizations.translate("Text_item_description")),
              _buildTextField(
                appLocalizations,
                descController,
                Icons.description,
                maxLines: 3,
              ),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          appLocalizations.translate("Text_item_price"),
                        ),
                        _buildTextField(
                          appLocalizations,
                          priceController,
                          Icons.attach_money,
                          isNumber: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(
                          appLocalizations.translate("Text_item_category"),
                        ),
                        _buildCategoryDropdown(appLocalizations),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    final String path = await PathGenerator.getTempImagePath(
                      filePath: image!.path,
                    );
                    print(path);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7622),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    appLocalizations.translate("button_save"),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helpers
  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8, top: 12),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );

  Widget _buildTextField(
    AppLocalizations appLocalizations,
    TextEditingController controller,

    IconData icon, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return AppTextField(
      prefixIcon: Icon(icon, color: AppColors.primary),
      validator: (value) => value!.isEmpty
          ? appLocalizations.translate("error_field_required")
          : null,
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }

  Widget _buildCategoryDropdown(AppLocalizations appLocalizations) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text(appLocalizations.translate("text_select_category")),
      items: categories.map((cat) {
        return DropdownMenuItem<int>(
          value: cat['id'],
          child: Text(cat['name']),
        );
      }).toList(),
      onChanged: (val) => setState(() => selectedCategoryId = val),
      validator: (val) => val == null
          ? appLocalizations.translate("error_field_required")
          : null,
    );
  }

  void clearForm() {
    nameController.clear();
    descController.clear();
    priceController.clear();
    setState(() => selectedCategoryId = null);
  }
}
