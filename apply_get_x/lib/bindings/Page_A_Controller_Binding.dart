import 'package:apply_get_x/controller/Page_A_Controller.dart';
import 'package:get/get.dart';

class Page_A_Controller_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Page_A_Controller());
  }
}
