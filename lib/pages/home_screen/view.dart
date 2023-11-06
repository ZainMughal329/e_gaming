import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/component/style/colors.dart';
import 'package:e_gamming_matcher/pages/home_screen/controller.dart';
import 'package:e_gamming_matcher/pages/home_screen/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/style/text_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          fontSize: 19,
          title:'Add User',


        ),
        backgroundColor: AppColors.iconColor,

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            HomeWidget(
              title: 'Add',
              icon: Icons.add,
              onpress: () {
                Get.toNamed(RoutesName.addUserScreen);
              },
            ),
            HomeWidget(
                title: 'All Users',
                onpress: () {},
                icon: Icons.border_all_sharp),
            HomeWidget(
                title: 'Matching', onpress: () {}, icon: Icons.roundabout_left)
          ],
        ),
      ),
    );
  }
}

