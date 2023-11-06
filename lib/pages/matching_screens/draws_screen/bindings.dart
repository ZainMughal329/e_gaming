import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/controller.dart';
import 'package:get/get.dart';

class DrawsScreenBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DrawsScreenController>(() => DrawsScreenController());
  }

}