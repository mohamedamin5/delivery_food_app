import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/Home/logic/home_bloc/home_bloc_import.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter_application_2/features/Home/presentation/widgets/custom_drop_down_bottom.dart';
import 'package:flutter_application_2/models/menu_item.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  // تحويل البيانات مرة واحدة فقط عند التشغيل وليس في كل Build

  // فصل منطق الفلترة في ميثود مستقلة لزيادة المقروئية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeSuccess) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _buildHeader(context, state.categories),
                    ),
                    _buildProductGrid(state.filteredItems),
                  ],
                );
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, List<String> allcategorie) {
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
            CustomDropDownBottom(allcategorie: allcategorie),
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
