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
          title:"Games",


        ),
        backgroundColor: AppColors.iconColor,
        leading: IconButton(onPressed: (){
          Get.back();
        },
          icon: Icon(Icons.arrow_back , color: Colors.white,),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              HomeWidget(
                title: 'Tekken-6',
                icon: Icons.gamepad,
                onpress: () {
                  // Get.toNamed(RoutesName.addUserScreen);
                  Get.to(()=>DrawsScreen(game: 'Taken-7'));

                },
              ),
              HomeWidget(
                title: 'Taken Tag',
                icon: Icons.gamepad,
                onpress: () {
                  // Get.toNamed(RoutesName.addUserScreen);
                  Get.to(()=>DrawsScreen(game: 'TakenTag'));

                },
              ),
              HomeWidget(
                title: 'Call Of Duty',
                icon: Icons.gamepad,
                onpress: () {
                  // Get.toNamed(RoutesName.addUserScreen);
                  Get.to(()=>DrawsScreen(game: 'Call-Of-Duty'));

                },
              ),
              HomeWidget(
                title: 'NFS',
                icon: Icons.gamepad,
                onpress: () {
                  // Get.toNamed(RoutesName.addUserScreen);
                  Get.to(()=>DrawsScreen(game: 'NFS'));

                },
              ),
              HomeWidget(
                title: 'Ludo',
                icon: Icons.gamepad,
                onpress: () {
                  // Get.toNamed(RoutesName.addUserScreen);
                  Get.to(()=>DrawsScreen(game: 'Ludo'));

                },
              ),
              HomeWidget(
                title: 'Pubg',
                icon: Icons.gamepad,
                onpress: () {
                  // Get.toNamed(RoutesName.addUserScreen);
                  Get.to(()=>DrawsScreen(game: 'Pubg'));

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
      ),
    );
  }
}
