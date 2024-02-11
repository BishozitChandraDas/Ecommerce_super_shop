import 'package:super_shop_ecommerce/app/data/database/box_class.dart';
import 'package:super_shop_ecommerce/config/app_config.dart';
import 'package:super_shop_ecommerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../data/database/hive_model.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_item.dart';
import '../widgets/checkout_container.dart';
import '../widgets/discount_indicator.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (CartController controller) {
      double amount = 1000 - controller.calculateSubtotal();

      return Scaffold(
        backgroundColor: AppColors.whiteBackground,
        appBar: AppBar(
          backgroundColor: AppColors.whiteBackground,
          title: Text(
            'Shopping Cart (${controller.box.values.toList().length})',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: checkoutContainer(
          subtotal: controller.calculateSubtotal().toString(),
          onTap: () {},
        ),
        body: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.box.values.toList().isEmpty
                  ? const SizedBox()
                  : discountIndicator(
                      price: controller.calculateSubtotal() > 0 &&
                              controller.calculateSubtotal() < 1000
                          ? amount.toString()
                          : "0",
                    ),

              SizedBox(height: 10.h),
              Text(
                "Added Items (${controller.box.values.toList().length} items)",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3.h),

              ///cart list
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Boxes.getData().listenable(),
                  builder: (context, box, child) {
                    final data = box.values.toList().cast<HiveProduct>();
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final product = data[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.w),
                          child: cartItem(
                            incrementTap: () {
                              controller.increaseQuantity(id: product.id);
                            },
                            decrementTap: () {
                              controller.decreaseQuantity(id: product.id);
                            },
                            deleteTap: () {
                              controller.deleteCartItem(product: product);
                            },
                            proImage: AppConfig.imgBaseURL + product.image!,
                            proName: "${product.name}",
                            cartItemCount: controller.quantity(id: product.id),
                            proPrice: "${product.price}",
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
