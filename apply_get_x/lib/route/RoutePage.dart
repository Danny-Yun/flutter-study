import 'package:apply_get_x/bindings/Page_A_Controller_Binding.dart';
import 'package:apply_get_x/screen/DefaultScreen.dart';
import 'package:apply_get_x/screen/Page_A.dart';
import 'package:get/get.dart';

class RoutePage {
  static const String DEFAULT_SCREEN = "/default_screen";
  static const String PAGE_A = "/page_a";

  static final List<GetPage> getPageList = [
    GetPage(
      name: DEFAULT_SCREEN,
      page: () => DefaultScreen(),
    ),
    GetPage(
      name: PAGE_A,
      page: () => Page_A(),
      binding: Page_A_Controller_Binding(),
    ),
  ];
}
