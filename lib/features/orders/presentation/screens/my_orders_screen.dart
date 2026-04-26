import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/features/orders/presentation/widgets/ordercardwidget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Ordercardwidget(
              orderStatus: "ordering",
              onTap: () {},
              onTap2: () {},
            );
          },
        ),
      ),
    );
  }
}
