import 'package:get/get.dart';

class PoodHomeController extends GetxController {
  static PoodHomeController get to => Get.find();
  RxInt pcIdx = 1.obs;

  void changeIdx() {
    if (pcIdx == 1) {
      pcIdx = 2.obs;
    } else {
      pcIdx = 1.obs;
    }
  }
}
