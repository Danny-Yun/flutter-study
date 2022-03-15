import 'package:get/get.dart';
import 'package:pood_category_tabview/model/GoodsModel.dart';
import 'package:pood_category_tabview/repository/CategoryDetailRepository.dart';
import 'package:pood_category_tabview/resource/Urls.dart';

class CategoryDetailController extends GetxController {
  static CategoryDetailController get to => Get.find();
  RxInt pageIdx = 0.obs;
  CategoryDetailRepository? categoryDetailRepository =
      CategoryDetailRepository();
}
