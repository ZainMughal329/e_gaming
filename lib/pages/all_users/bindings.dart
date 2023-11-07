import 'package:e_gamming_matcher/pages/add_users/controller.dart';
import 'package:e_gamming_matcher/pages/all_users/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:get/get.dart';

class AllUserScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AllUserScreenController>(() => AllUserScreenController());
  }

}