import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

Widget productContainer({
  required bool isButtonClicked,
  required VoidCallback incrementTap,
  required VoidCallback decrementTap,
  required VoidCallback addToCartTap,
  required int cartItem,
  required String proImage,
  required String proDiscountImage,
  required String? proDiscount,
  required String plasticStatus,
  required int proStock,
  required String proName,
  required String? proWeight,
  required String proNewPrice,
  required String proOldPrice,
}) {
  return Container(
    padding: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            ///product image || discount
            Container(
              height: 140.h,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(proImage),
                ),
              ),
              child: proDiscount == null
                  ? const SizedBox()
                  : Container(
                      height: 50.h,
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            proDiscountImage,
                          ),
                        ),
                      ),
                      child: Transform.rotate(
                        angle: math.pi / 8,
                        child: Text(
                          proDiscount,
                          style: TextStyle(
                            color: AppColors.redAccentColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
            ),

            ///cart
            Align(
              alignment: Alignment.topLeft,
              child: isButtonClicked
                  ? Container(
                      width: 150.w,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors.green,
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
                            child: Icon(
                              CupertinoIcons.minus,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            "$cartItem",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          InkWell(
                            onTap: incrementTap,
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: addToCartTap,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                        child: cartItem == 0
                            ? Icon(
                                Icons.add,
                                color: AppColors.whiteColor,
                                size: 30.h,
                              )
                            : Text(
                                "$cartItem",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                      ),
                    ),
            ),
          ],
        ),

        ///product plastic status
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: AppColors.tealColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              plasticStatus,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        ///product stock status
        Text(
          proStock <= 0 ? "" : "IN STOCK",
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
          ),
        ),

        ///product name
        Text(
          proName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),

        ///product weight
        Text(
          proWeight == "null" ? "" : proWeight.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),

        ///product price
        Row(
          children: [
            Text(
              "৳ $proNewPrice",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              "৳ $proOldPrice",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.greyColor,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
