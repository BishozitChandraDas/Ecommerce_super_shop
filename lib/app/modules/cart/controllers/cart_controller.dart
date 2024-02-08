import 'package:super_shop_ecommerce/app/data/database/box_class.dart';
import 'package:super_shop_ecommerce/app/data/database/hive_model.dart';
import 'package:get/get.dart';

import '../../../model/product_model.dart';

class CartController extends GetxController {
  final box = Boxes.getData();

  ///add to cart product
  addToCart({required ProductModel product}) {
    final existingIndex =
        box.values.toList().indexWhere((item) => item.id == product.id);
    if (existingIndex == -1) {
      final data = HiveProduct(
        id: product.id!,
        quantity: product.proQuantity,
        name: product.name,
        description: product.description,
        price: product.price.toString(),
        weight: product.productWeight,
        image: product.image,
      );
      box.add(data);
      data.save();
    }
  }

  ///increment quantity
  increaseQuantity({required String id}) async {
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i)!.id == id) {
        box.getAt(i)!.quantity += 1;

        ///update quantity in database
        final updateQuantity = box.getAt(i);
        updateQuantity!.quantity = box.getAt(i)!.quantity;
        updateQuantity.save();
      }
    }
    update();
  }

  ///decrement quantity
  decreaseQuantity({required String id}) {
    for (int i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      if (product!.id == id) {
        if (product.quantity > 1) {
          product.quantity -= 1;

          ///update quantity in database
          final updateQuantity = box.getAt(i);
          updateQuantity!.quantity = box.getAt(i)!.quantity;
          updateQuantity.save();
        } else {
          deleteCartItem(product: product);
        }
      }
    }
    update();
  }

  void isButtonClicked(ProductModel product) {
    product.isBtnClicked = true;
    Future.delayed(const Duration(seconds: 5), () {
      product.isBtnClicked = false;
      update();
    });
    update();
  }

  ///product id wise quantity
  int quantity({required String id}) {
    int result = 0;
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i)!.id == id) {
        result = box.getAt(i)!.quantity;
        //log("quantity: $result");
      }
    }
    return result;
  }

  ///delete cart item
  void deleteCartItem({required HiveProduct product}) async {
    await product.delete();
    update();
  }

  //calculate subtotal
  double calculateSubtotal() {
    double subtotal = 0.0;
    for (int i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      subtotal += double.parse(product!.price.toString()) * product.quantity;
    }

    return subtotal;
  }
}
