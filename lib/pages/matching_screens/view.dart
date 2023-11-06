import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/component/style/colors.dart';
import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:e_gamming_matcher/pages/home_screen/widgets/home_widget.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchingScreenView extends StatelessWidget {
  const MatchingScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          fontSize: 19,
          title:'Games',


        ),
        backgroundColor: AppColors.iconColor,

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            HomeWidget(
              title: 'Tekken-7',
              icon: Icons.gamepad,
              onpress: () {
                // Get.toNamed(RoutesName.addUserScreen);
                Get.to(()=>DrawsScreen(game: 'Taken-7'));

              },
            ),
            // HomeWidget(
            //     title: 'All Users',
            //     onpress: () {},
            //     icon: Icons.border_all_sharp),
            // HomeWidget(
            //     title: 'Matching', onpress: () {}, icon: Icons.roundabout_left)
          ],
        ),
      ),
    );
  }
}
