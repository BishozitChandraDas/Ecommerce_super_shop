import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget discountIndicator({
  required String price,
}) {
  double amount = double.parse(price);
  double percentage = amount <= 1000 ? (1000 - amount) / 1000 : 1.0;
  percentage = percentage.clamp(0.0, 1.0);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Add items worth ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            TextSpan(
              text: 'Tk $price ',
              style: TextStyle(
                color: AppColors.green,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'for free shopping',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5.h),
      LinearPercentIndicator(
        lineHeight: 8.h,
        percent: percentage,
        barRadius: Radius.circular(5.r),
        backgroundColor: AppColors.grey,
        progressColor: AppColors.green,
      ),
    ],
  );
}
