import 'package:apply_get_x/bindings/Page_A_Controller_Binding.dart';
import 'package:apply_get_x/bindings/UpdateCheckScreenControllerBinding.dart';
import 'package:apply_get_x/screen/DefaultScreen.dart';
import 'package:apply_get_x/screen/EventScreen.dart';
import 'package:apply_get_x/screen/ListViewScreen.dart';
import 'package:apply_get_x/screen/Page_A.dart';
import 'package:apply_get_x/screen/UpdateCheckScreen.dart';
import 'package:get/get.dart';

class RoutePage {
  static const String DEFAULT_SCREEN = "/default_screen";
  static const String PAGE_A = "/page_a";
  static const String LIST_VIEW_SCREEN = "/list_view";
  static const String UPDATE_CHECK_SCREEN = "/update_check";
  static const String EVENT_SCREEN = "/eventScreen";

  static movePage(String pageName) => Get.toNamed(pageName);

  // 데이터와 함께 이동할 때
  static movePageWithArgumment(String pageName, dynamic argument) {
    print(argument);
    Get.toNamed(pageName, arguments: argument);
  }

  // 페이지 이동 및 데이터 전달 -> return Callback 추가
  static Future<dynamic> movePageWithArgummentResult(
      String pageName, dynamic argument) async {
    return await Get.toNamed(pageName, arguments: argument);
  }

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
    GetPage(
      name: LIST_VIEW_SCREEN,
      page: () => ListViewScreen(),
    ),
    GetPage(
      name: UPDATE_CHECK_SCREEN,
      page: () => UpdateCheckScreen(),
      transition: Transition.rightToLeft,
      binding: UpdateCheckScreenControllerBinding(),
    ),
    GetPage(
      name: EVENT_SCREEN,
      page: () => EventScreen(),
    ),
  ];
}
