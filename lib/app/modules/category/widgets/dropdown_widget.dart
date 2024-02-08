import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:super_shop_ecommerce/constant/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

Widget sortDropdownWidget({required CategoryController controller}) {
  return Obx(() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Sort By: "),
        SizedBox(
          width: 160.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<SortOrder>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.r),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.green,
                  ),
                ),
              ),
              value: controller.currentSortOrder.value,
              onChanged: (SortOrder? newValue) {
                if (newValue != null) {
                  controller.changeSortOrder(newValue);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: SortOrder.none,
                  child: Text("None"),
                ),
                DropdownMenuItem(
                  value: SortOrder.priceLowToHigh,
                  child: Text("Price Low to High"),
                ),
                DropdownMenuItem(
                  value: SortOrder.priceHighToLow,
                  child: Text("Price High to Low"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  });
}
