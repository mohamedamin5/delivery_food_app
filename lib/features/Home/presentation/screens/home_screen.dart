import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter_application_2/features/Home/listrest.dart';
import 'package:flutter_application_2/features/Home/logic/home_bloc/home_bloc_import.dart';
import 'package:flutter_application_2/features/Home/logic/widgets_provider/custom_drop_down_bloc/custom_drop_down_bloc_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12.w),
          child: BlocBuilder(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeSuccess) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          _buildHeader(
                            appLocalizations.translate('home_deliver_to'),
                          ),
                          SizedBox(height: 20.h),
                          _buildSearchBar(
                            appLocalizations.translate('search_hint'),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLocalizations.translate(
                                  "home_all_categories",
                                ),
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Row(
                                children: [
                                  Text(
                                    appLocalizations.translate("home_see_all"),
                                  ),
                                  const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Color(0xFFA0A5BA),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          _buildCategoryList(),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLocalizations.translate(
                                  "home_open_restaurants",
                                ),
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      appLocalizations.translate(
                                        "home_see_all",
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Color(0xFFA0A5BA),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    SliverList.builder(
                      itemCount: state.restaurantlist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/restaurantDetalis");
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            height: 255.h,
                            child: Column(
                              children: [
                                Container(
                                  height: 115.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC4C4C4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  state.restaurantlist[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  state.restaurantlist[index].categorie.keys
                                      .join(' - '),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.delivery_dining,
                                          color: Color(0xFFFF7622),
                                        ),
                                        Text(
                                          state.restaurantlist[index].delivery,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_border,
                                          color: Color(0xFFFF7622),
                                        ),
                                        Text(
                                          state.restaurantlist[index].rating
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Color(0xFFFF7622),
                                        ),
                                        Text(state.restaurantlist[index].time),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomCircleButton(
              size: 46,
              bgColor: AppColors.cardBackground,
              icon: Icon(Icons.menu),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                Text("Username"),
              ],
            ),
          ],
        ),

        Stack(
          children: [
            CustomCircleButton(
              bgColor: AppColors.secondaryAction,
              icon: Icon(Icons.shopping_cart_outlined, color: AppColors.white),
            ),
            Positioned(
              right: 0,
              child: CustomCircleButton(
                size: 16,
                bgColor: AppColors.primary,
                icon: Text(
                  "3",
                  style: TextStyle(fontSize: 10.sp, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<DropDownBloc>().add(
                DropDownSelectEvent(categories[index]),
              );
              // context.read(categorySelectedProvider.notifier).state =
              categories[index];
              Navigator.pushNamed(context, "/categorie");
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: 103.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(39),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFF98A8B8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar(String hint) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
