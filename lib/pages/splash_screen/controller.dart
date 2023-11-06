import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/pages/splash_screen/state.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final state = SplashState();

  goToHomePage() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAndToNamed(RoutesName.homeScreen);
      },
    );
  }
}
