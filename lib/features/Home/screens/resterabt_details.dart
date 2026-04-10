import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/themes/appcolor.dart';
import 'package:flutter_application_2/core/widget/customcirclebutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResterabtDetails extends StatefulWidget {
  const ResterabtDetails({super.key});

  @override
  State<ResterabtDetails> createState() => _ResterabtDetailsState();
}

class _ResterabtDetailsState extends State<ResterabtDetails> {
  List<String> category = ['Pizza', 'Burger', 'Pasta', 'Salad', 'Dessert'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildHeader(), _buildRestaurantInfo()],
                ),
              ),

              SliverToBoxAdapter(child: _buildCategoryList()),
              SliverToBoxAdapter(child: SizedBox(height: 32.h)),
              SliverToBoxAdapter(
                child: Text(
                  'Burger (10)',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SliverGrid.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 21.w,
                  mainAxisSpacing: 17.h,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 153.w,
                    height: 165.h,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          width: 114.w,
                          height: 79.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF98A8B8),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'ssssss',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFF58D1D),
                          ),
                          child: const Icon(Icons.add_sharp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        SizedBox(height: 50.w),
        Row(
          children: [
            CustomCircleButton(
              onTap: () => Navigator.pop(context),
              size: 45,
              bgColor: AppColors.cardBackground,
              icon: Icon(Icons.arrow_back_ios),
            ),
            SizedBox(width: 12.w),
            Text(
              "Restaurant View",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRestaurantInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 37.h),
        Center(
          child: Container(
            height: 184.h,
            width: 327.w,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Spicy restaurant',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        SizedBox(height: 7.h),
        Text(
          'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.delivery_dining, color: Color(0xFFFF7622)),
                Text('Free'),
              ],
            ),
            SizedBox(width: 36.w),
            Row(
              children: [
                const Icon(Icons.star_border, color: Color(0xFFFF7622)),
                Text('4.7'),
              ],
            ),
            SizedBox(width: 36.w),
            Row(
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  color: Color(0xFFFF7622),
                ),
                Text(' 20 min'),
              ],
            ),
          ],
        ),
        SizedBox(height: 50.w),
      ],
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 46.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle category tap
            },
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              width: 89.w,
              height: 46.h,
              alignment: Alignment.center,

              decoration: BoxDecoration(
                color: const Color(0xFFFFEBE4),
                borderRadius: BorderRadius.circular(33),
              ),
              child: Text(
                category[index],
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              ),
            ),
          );
        },
      ),
    );
  }
}
