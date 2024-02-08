import 'dart:convert';

import 'package:super_shop_ecommerce/app/model/product_model.dart';
import 'package:super_shop_ecommerce/config/app_config.dart';
import 'package:super_shop_ecommerce/constant/enum.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  Rx<SortOrder> currentSortOrder = SortOrder.none.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      loading.value = true;
      final List<ProductModel> fetchedProducts = await fetchedProduct();
      products.assignAll(fetchedProducts);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<ProductModel>> fetchedProduct() async {
    String url = "${AppConfig.baseURL}productGroup/products/appTestProducts";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((product) => ProductModel.fromJson(product)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void changeSortOrder(SortOrder newSortOrder) {
    currentSortOrder.value = newSortOrder;
    sortProducts();
  }

  void sortProducts() {
    switch (currentSortOrder.value) {
      case SortOrder.none:
        fetchData();
        break;
      case SortOrder.priceLowToHigh:
        products.sort((a, b) => a.price!.compareTo(b.price!));
        break;
      case SortOrder.priceHighToLow:
        products.sort((a, b) => b.price!.compareTo(a.price!));
        break;
    }
  }
}
