import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavbarController extends GetxController {
  int currentIndex = 0;

  void changeTabIndex(int index) {
    currentIndex = index;

    update();
  }

  GetStorage loginState = GetStorage();
}
