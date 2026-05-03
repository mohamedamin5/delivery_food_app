import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/orders/presentation/widgets/ordercardwidget.dart';

class OrderingScreen extends StatelessWidget {
  const OrderingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Ordercardwidget(
          orderStatus: "ordering",
          onTap: () {},
          onTap2: () {},
        );
      },
    );
  }
}
