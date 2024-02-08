import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cartItem({
  required VoidCallback incrementTap,
  required VoidCallback decrementTap,
  required VoidCallback deleteTap,
  required String proImage,
  required String proName,
  required int cartItemCount,
  required String proPrice,
}) {
  return Row(
    children: [
      ///product image
      Image.network(
        proImage,
        width: 60.w,
        fit: BoxFit.fill,
      ),

      SizedBox(width: 10.w),

      ///product name || item increment & decrement
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              proName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.w),
            Container(
              width: 150.w,
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.redAccentColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: decrementTap,
                    child: const Icon(CupertinoIcons.minus),
                  ),
                  Text(cartItemCount.toString()),
                  InkWell(
                    onTap: incrementTap,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      ///price || delete button
      Column(
        children: [
          Text(
            proPrice,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: deleteTap,
            icon: Icon(
              Icons.delete,
              color: AppColors.redAccentColor,
            ),
          ),
        ],
      ),
    ],
  );
}
