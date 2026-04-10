import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/custom_drop_down_bottom.dart';
import 'package:flutter_application_2/core/widget/customcirclebutton.dart';
import 'package:flutter_application_2/features/Home/listrest.dart';
import 'package:flutter_application_2/features/Home/providers/categorie_selected.dart';
import 'package:flutter_application_2/models/menu_item.dart';
import 'package:flutter_application_2/models/resttaurant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsScreen extends ConsumerStatefulWidget {
  const CategoryProductsScreen({super.key});

  @override
  ConsumerState<CategoryProductsScreen> createState() =>
      _CategoryProductsScreenState();
}

class _CategoryProductsScreenState
    extends ConsumerState<CategoryProductsScreen> {
  // تحويل البيانات مرة واحدة فقط عند التشغيل وليس في كل Build
  late final List<Restaurant> _restaurantList;

  @override
  void initState() {
    super.initState();
    _restaurantList = restaurants.map((e) => Restaurant.fromjson(e)).toList();
  }

  // فصل منطق الفلترة في ميثود مستقلة لزيادة المقروئية
  List<MenuItem> _getFilteredItems(String selectedCategory) {
    if (selectedCategory == "All") {
      return _restaurantList
          .expand((r) => r.categorie.values)
          .expand((list) => list)
          .toList();
    }

    if (selectedCategory == "Other") {
      return _restaurantList
          .expand((r) => r.categorie.entries)
          .where((entry) => !categories.contains(entry.key))
          .expand((entry) => entry.value)
          .toList();
    }

    return _restaurantList
        .expand((r) => r.categorie.entries)
        .where((entry) => entry.key == selectedCategory)
        .expand((entry) => entry.value)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(categorySelectedProvider);
    final allItems = _getFilteredItems(selectedCategory);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(context)),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              _buildProductGrid(allItems),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomCircleButton(
              size: 45,
              bgColor: AppColors.cardBackground,
              icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(width: 8.w),
            CustomDropDownBottom(allcategorie: categories),
          ],
        ),
        _buildHeaderActions(),
      ],
    );
  }

  Widget _buildHeaderActions() {
    return Row(
      children: [
        CustomCircleButton(
          size: 46,
          bgColor: AppColors.secondaryAction,
          icon: const Icon(Icons.search, color: Colors.white),
          onTap: () {},
        ),
        SizedBox(width: 10.w),
        CustomCircleButton(
          size: 46,
          bgColor: AppColors.cardBackground,
          icon: const Icon(Icons.tune_sharp),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildProductGrid(List<MenuItem> items) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 21.w,
        mainAxisSpacing: 21.h,
        childAspectRatio: 0.8, // ضبط التناسب لضمان عدم حدوث Overflow
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) => _ProductCard(item: items[index]),
      ),
    );
  }
}

// فصل الكارد في Widget منفصل لتحسين الأداء ومنع إعادة بناء الصفحة بالكامل
class _ProductCard extends StatelessWidget {
  final MenuItem item;
  const _ProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/productDetails"),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF98A8B8),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              item.name,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            CustomCircleButton(
              size: 32,
              bgColor: AppColors.primary,
              icon: Icon(Icons.add, color: Colors.white, size: 20.sp),
              onTap: () {},
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
