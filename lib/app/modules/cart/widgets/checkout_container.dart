 import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget checkoutContainer({
    required String subtotal,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 90.h,
      color: AppColors.tealColor,
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Subtotal: ",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                subtotal,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                "Checkout",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
