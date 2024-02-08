// ignore_for_file: unused_local_variable, use_key_in_widget_constructors

import 'package:super_shop_ecommerce/app/model/product_model.dart';
import 'package:super_shop_ecommerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:super_shop_ecommerce/config/app_config.dart';
import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../widgets/category_action_icon.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/product_container.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Fruits & Vegetables",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          actionIconWidget(
            icon: Icons.dark_mode_outlined,
          ),
          SizedBox(width: 10.w),
          actionIconWidget(
            icon: Icons.favorite_border,
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: GetBuilder(builder: (CategoryController controller) {
          return Column(
            children: [
              sortDropdownWidget(controller: controller),
              SizedBox(height: 10.h),
              Expanded(
                child: Obx(() {
                  final List<ProductModel> sortedProducts =
                      controller.products.toList();

                  return controller.loading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          itemCount: sortedProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 10.h,
                            mainAxisExtent: 280.h,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final data = sortedProducts[index];
                            return GetBuilder<CartController>(
                              init: CartController(),
                              builder: (CartController cartController) {
                                return productContainer(
                                  isButtonClicked: data.isBtnClicked,
                                  addToCartTap: () {
                                    cartController.addToCart(product: data);
                                    cartController.isButtonClicked(data);
                                  },
                                  incrementTap: () {
                                    cartController.increaseQuantity(
                                        id: data.id!);
                                  },
                                  decrementTap: () {
                                    cartController.decreaseQuantity(
                                        id: data.id!);
                                  },
                                  cartItem:
                                      cartController.quantity(id: data.id!),
                                  proImage: AppConfig.imgBaseURL + data.image!,
                                  proDiscountImage:
                                      "assets/images/discount.png",
                                  proDiscount: data.discountType == "percentage"
                                      ? "${data.discountAmount}% OFF"
                                      : data.discountType == "fixedAmount"
                                          ? "TAKA ${data.discountAmount} OFF"
                                          : null,
                                  plasticStatus: data.isPlastic!
                                      ? data.plasticType!.name!
                                      : "PLASTIC FREE",
                                  proStock: data.quantity!,
                                  proName: "${data.name}",
                                  proWeight: data.productWeight,
                                  proNewPrice: "${data.price}",
                                  proOldPrice: "150",
                                );
                              },
                            );
                          },
                        );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
