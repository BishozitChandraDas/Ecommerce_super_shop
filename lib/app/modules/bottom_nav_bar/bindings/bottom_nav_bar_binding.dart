import 'package:super_shop_ecommerce/app/modules/category/controllers/category_controller.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(
      () => BottomNavBarController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
