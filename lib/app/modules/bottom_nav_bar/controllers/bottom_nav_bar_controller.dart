import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var currentIndex = 0.obs;

  void onItemTapped({required int index}) {
    currentIndex.value = index;
  }
}
