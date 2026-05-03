import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter_application_2/features/orders/presentation/screens/history_order_screen.dart';
import 'package:flutter_application_2/features/orders/presentation/screens/ordering_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [OrderingScreen(), HistoryOrderScreen()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            SizedBox(height: 50.h),
            _buildAppBar(),
            _buildTabBar(),
            Expanded(child: _screens[_selectedIndex]),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 60,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          Text(
            "My Orders",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 33.h,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _onTabTapped(0),
              child: Text(
                "Ordering",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _onTabTapped(1),
              child: Text(
                "History",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
