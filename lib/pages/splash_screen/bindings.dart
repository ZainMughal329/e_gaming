import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:get/get.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }

}