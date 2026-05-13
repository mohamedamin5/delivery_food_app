import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/localization/app_localizations_delegate.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(appLocalizations),
              const SizedBox(height: 30),

              // Summary Statistics
              Row(
                children: [
                  _buildSummaryCard(
                    appLocalizations.translate("text_running_orders"),
                    "20",
                  ),
                  const SizedBox(width: 15),
                  _buildSummaryCard(
                    appLocalizations.translate("text_order_request"),
                    "05",
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Revenue Section (Empty Chart Container)
              _buildRevenueCard(appLocalizations),
              const SizedBox(height: 25),

              // Reviews Section
              _buildReviewsCard(appLocalizations),
              const SizedBox(height: 25),

              // Popular Items Section
              _buildPopularItemsSection(appLocalizations),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFFF5F1),
        shape: const CircleBorder(
          side: BorderSide(color: Colors.orange, width: 1.5),
        ),
        elevation: 2,
        child: const Icon(Icons.add, color: Colors.orange, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader(var lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.short_text, size: 30),
        ),
        Column(
          children: [
            Text(
              lang.translate("text_location"),
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.2,
              ),
            ),
            Row(
              children: const [
                Text(
                  "Halal Lab office",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF2D3142),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Color(0xFF2D3142)),
              ],
            ),
          ],
        ),
        const CircleAvatar(backgroundColor: Color(0xFFA0B2C1), radius: 25),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF9EA3AE),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(var lang) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.translate("text_total_revenue"),
                    style: const TextStyle(
                      color: Color(0xFF9EA3AE),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "\$2,241",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      lang.translate("button_see_details"),
                      style: const TextStyle(
                        color: Colors.orange,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          lang.translate("text_daily"),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Empty Container for Chart as requested
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              // Placeholder styling
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsCard(var lang) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lang.translate("text_reviews"),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF2D3142),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  lang.translate("button_see_all_reviews"),
                  style: const TextStyle(
                    color: Colors.orange,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 32),
              const SizedBox(width: 8),
              const Text(
                "4.9",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                lang.translate("text_total_reviews"),
                style: const TextStyle(color: Color(0xFF9EA3AE), fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItemsSection(var lang) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lang.translate("text_popular_items_this_weeks"),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF2D3142),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                lang.translate("button_see_all"),
                style: const TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _itemPlaceholder(),
            const SizedBox(width: 15),
            _itemPlaceholder(),
          ],
        ),
      ],
    );
  }

  Widget _itemPlaceholder() {
    return Expanded(
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: const Color(0xFFA0B2C1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      height: 70,
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Colors.orange,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFFD0D3D8), size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Color(0xFFD0D3D8),
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline_rounded,
              color: Color(0xFFD0D3D8),
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
