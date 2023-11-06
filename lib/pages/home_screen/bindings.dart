import 'package:e_gamming_matcher/pages/home_screen/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}