import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.goToHomePage();
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
