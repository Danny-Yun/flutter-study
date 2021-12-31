import 'package:apply_get_x/controller/UpdateCheckScreenController.dart';
import 'package:get/get.dart';

class UpdateCheckScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdateCheckScreenController());
  }
}
