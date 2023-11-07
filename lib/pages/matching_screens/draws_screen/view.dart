import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/style/button.dart';
import 'package:e_gamming_matcher/component/style/snackbar.dart';
import 'package:e_gamming_matcher/pages/matching_screens/components/details_card.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/style/colors.dart';
import '../../../component/style/text_widget.dart';

class DrawsScreen extends GetView<DrawsScreenController> {
  String game;

  DrawsScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.state.gameValue = game;
    controller.refreshRandomData(game);
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          fontSize: 19,
          title: game,
        ),
        backgroundColor: AppColors.iconColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: controller.ref
                .where('game', isEqualTo: controller.state.gameValue)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF283593),
                  ),
                );
              }
              if (snapshot.hasError) {
                CustomSnackBar.showSnackBar(
                    'Error', snapshot.error.toString(), Icons.info_outline);
                return Container(
                  child: Text("Snapshot error"),
                );
              }
              if (snapshot.data!.docs.isEmpty || controller.state.x.value == 0 || controller.state.y.value == 0 ) {
                return Center(
                  child: Text('No Users in the Database'),
                );
              }

              return Obx(() => Column(
                    children: [
                      controller.state.x.value != 0 ? StudentCard(
                        name: snapshot
                            .data!.docs[controller.state.x.value]['userName']
                            .toString(),
                        rollNo: snapshot
                            .data!.docs[controller.state.x.value]['rollNo']
                            .toString(),
                        phoneNumber: snapshot
                            .data!.docs[controller.state.x.value]['phone']
                            .toString(),
                        deptName: snapshot
                            .data!.docs[controller.state.x.value]['department']
                            .toString(),
                        gameName: snapshot
                            .data!.docs[controller.state.x.value]['game']
                            .toString(),
                        semester: snapshot
                            .data!.docs[controller.state.x.value]['semester']
                            .toString(),
                        onTap: () {
                          controller.deleteUser(
                            snapshot.data!.docs[controller.state.x.value]['id']
                                .toString(),
                          );
                          controller.refreshRandomData(game);
                          Navigator.of(context).pop();
                        },
                      ) : Container(),
                      controller.state.y.value != 0
                          ? StudentCard(
                              name: snapshot.data!
                                  .docs[controller.state.y.value]['userName']
                                  .toString(),
                              rollNo: snapshot.data!
                                  .docs[controller.state.y.value]['rollNo']
                                  .toString(),
                              phoneNumber: snapshot
                                  .data!.docs[controller.state.y.value]['phone']
                                  .toString(),
                              deptName: snapshot.data!
                                  .docs[controller.state.y.value]['department']
                                  .toString(),
                              gameName: snapshot
                                  .data!.docs[controller.state.y.value]['game']
                                  .toString(),
                              semester: snapshot.data!
                                  .docs[controller.state.y.value]['semester']
                                  .toString(),
                              onTap: () {
                                controller.deleteUser(
                                  snapshot.data!
                                      .docs[controller.state.y.value]['id']
                                      .toString(),
                                );
                                controller.refreshRandomData(game);

                                Navigator.of(context).pop();
                              },
                            )
                          :

                      Container(),

                      RoundButton(
                          title: 'Refresh',
                          onPress: () {
                            controller.refreshRandomData(game);
                          })
                    ],
                  ));
              // return ListView.builder(
              //   itemCount: snapshot.data!.docs.length,
              //   itemBuilder: (context, index) {
              //     Random random = Random();
              //     int x = random.nextInt(snapshot.data!.docs.length); // Replace 100 with your desired range
              //     int y = random.nextInt(snapshot.data!.docs.length);
              //     print("x value is"+ x.toString());
              //     print("y value is"+ y.toString());
              //    return ListTile(
              //      title: Text(snapshot.data!.docs[x]['userName'].toString()),
              //    );
              //   },
              // );
            },
          ),
        ),
      ),
    );
  }
}
