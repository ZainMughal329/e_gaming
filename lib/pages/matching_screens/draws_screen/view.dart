import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/style/button.dart';
import 'package:e_gamming_matcher/component/style/snackbar.dart';
import 'package:e_gamming_matcher/pages/matching_screens/components/details_card.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawsScreen extends GetView<DrawsScreenController> {
  String game;
  DrawsScreen({Key? key, required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.state.gameValue = game;
    return Scaffold(
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
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text('No Users in the Database'),
                );
              }
              int dataLength = snapshot.data!.docs.length;
              Random random = Random();
              int x = random
                  .nextInt(dataLength); // Replace 100 with your desired range
              int y;
              do {
                y = random
                    .nextInt(dataLength); // Replace 100 with your desired range
              } while (y == x);
              return Column(
                children: [
                  StudentCard(
                    name: snapshot.data!.docs[x]['userName'].toString(),
                    rollNo: snapshot.data!.docs[x]['rollNo'].toString(),
                    phoneNumber: snapshot.data!.docs[x]['phone'].toString(),
                    deptName: snapshot.data!.docs[x]['department'].toString(),
                    gameName: snapshot.data!.docs[x]['game'].toString(),
                    semester: snapshot.data!.docs[x]['semester'].toString(),
                  ),
                  StudentCard(
                    name: snapshot.data!.docs[y]['userName'].toString(),
                    rollNo: snapshot.data!.docs[y]['rollNo'].toString(),
                    phoneNumber: snapshot.data!.docs[y]['phone'].toString(),
                    deptName: snapshot.data!.docs[y]['department'].toString(),
                    gameName: snapshot.data!.docs[y]['game'].toString(),
                    semester: snapshot.data!.docs[y]['semester'].toString(),
                  ),
                  RoundButton(title: 'Refresh', onPress: () {})
                ],
              );
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
