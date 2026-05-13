import 'package:flutter/material.dart';

class EditRestaurantPage extends StatefulWidget {
  const EditRestaurantPage({super.key});

  @override
  State<EditRestaurantPage> createState() => _EditRestaurantPageState();
}

class _EditRestaurantPageState extends State<EditRestaurantPage> {
  // Controllers correspond to RestaurantUpdate model (Optional fields)
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController deliveryPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF1E293B,
      ), // خلفية داكنة لتمييز صفحة الإعدادات
      appBar: AppBar(
        title: const Text(
          "إعدادات المطعم",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "تعديل المعلومات الأساسية",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "يمكنك ترك الحقول فارغة إذا كنت لا ترغب بتغييرها",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              _buildField(
                "اسم المطعم",
                nameController,
                Icons.store,
                "اسم مطعمك الجديد",
              ),
              _buildField(
                "وصف المطعم",
                descController,
                Icons.info_outline,
                "وصف قصير للمطعم",
                maxLines: 2,
              ),
              _buildField(
                "العنوان",
                addressController,
                Icons.location_on,
                "مثال: الرياض - حي النخيل",
              ),
              _buildField(
                "سعر التوصيل",
                deliveryPriceController,
                Icons.delivery_dining,
                "0.00",
                isNumber: true,
              ),

              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "تحديث البيانات",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller,
    IconData icon,
    String hint, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Colors.blueGrey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFF7622), width: 2),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
