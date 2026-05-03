import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/orders/presentation/widgets/ordercardwidget.dart';

class HistoryOrderScreen extends StatelessWidget {
  const HistoryOrderScreen({super.key});

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
