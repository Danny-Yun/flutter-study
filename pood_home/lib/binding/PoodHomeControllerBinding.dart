import 'package:get/instance_manager.dart';
import 'package:pood_home/controller/PoodHomeController.dart';

class PoodHomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoodHomeController());
  }
}
