import 'package:e_gamming_matcher/pages/add_users/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:get/get.dart';

class AddUserScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddUserScreenController>(() => AddUserScreenController());
  }

}