// ignore_for_file: unrelated_type_equality_checks

import 'package:super_shop_ecommerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:super_shop_ecommerce/app/modules/category/views/category_view.dart';
import 'package:super_shop_ecommerce/app/modules/home/views/home_view.dart';
import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:super_shop_ecommerce/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_bar_controller.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavBarView extends GetView<BottomNavBarController> {
   BottomNavBarView({Key? key}) : super(key: key);

  final pageList =  [
    const HomeView(),
    CategoryView(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Menu"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Get.toNamed("/cart");
        },
        child: Container(
          height: 75.h,
          width: 75.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.green,
            shape: BoxShape.circle,
          ),
          child: GetBuilder(
              init: CartController(),
              builder: (CartController cartController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.h),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -10, end: -12),
                      badgeContent: Text(
                        cartController.box.values.toList().length.toString(),
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: AppColors.whiteColor,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.whiteColor,
                        size: 25.h,
                      ),
                    ),
                    Text(
                      '৳ ${cartController.calculateSubtotal()}',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //home
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 0);
                  },
                  icon: Icons.home_sharp,
                  label: home,
                  color: controller.currentIndex == 0
                      ? AppColors.green
                      : AppColors.greyColor,
                ),
              ),
              //category
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 1);
                  },
                  icon: Icons.dashboard,
                  label: category,
                  color: controller.currentIndex == 1
                      ? AppColors.green
                      : AppColors.greyColor,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              //search
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 2);
                  },
                  icon: Icons.search,
                  label: search,
                  color: controller.currentIndex == 2
                      ? AppColors.green
                      : AppColors.greyColor,
                ),
              ),
              //menu
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 3);
                  },
                  icon: Icons.menu,
                  label: menu,
                  color: controller.currentIndex == 3
                      ? AppColors.green
                      : AppColors.greyColor,
                ),
              ),
            ],
          );
        }),
      ),
      body: Obx(() {
        return pageList[controller.currentIndex.value];
      }),
    );
  }

  InkWell navbarIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
