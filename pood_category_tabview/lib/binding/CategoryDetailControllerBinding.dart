import 'package:get/get.dart';
import 'package:pood_category_tabview/controller/CategoryDetailController.dart';

class CategoryDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryDetailController());
  }
}
