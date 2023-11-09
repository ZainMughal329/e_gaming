import 'package:e_gamming_matcher/pages/add_users/controller.dart';
import 'package:e_gamming_matcher/pages/matching_screens/edit_user/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:get/get.dart';

class EditUserScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditUserScreenController>(() => EditUserScreenController());
  }

}