import 'package:e_gamming_matcher/pages/search/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchBarController>(() => SearchBarController());
  }

}