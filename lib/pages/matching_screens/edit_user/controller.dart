import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/models/user_model/user_model.dart';
import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/pages/add_users/state.dart';
import 'package:e_gamming_matcher/pages/home_screen/view.dart';
import 'package:e_gamming_matcher/pages/matching_screens/edit_user/state.dart';
import 'package:e_gamming_matcher/pages/splash_screen/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/style/snackbar.dart';

class EditUserScreenController extends GetxController {
  final state = EditUserState();
  UserModel? userModel;
  DocumentSnapshot? documentSnapshot;

  setLoading(value) {
    state.loading.value = value;
  }



  fetchUsersDetails(String userId) async {
    try {
      documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (documentSnapshot!.exists) {
        userModel = UserModel(
          userName: documentSnapshot!['userName'],
          phone: documentSnapshot!['phone'],
          semester: documentSnapshot!['semester'],
          game: documentSnapshot!['game'],
          department: documentSnapshot!['department'],
          rollNo: documentSnapshot!['rollNo'],
        );
      }
      state.isLoseValue.value = documentSnapshot!['isLose'];
      state.semValue.value = documentSnapshot!['semester'];
      state.deptValue.value = documentSnapshot!['department'];
      state.gameValue.value = documentSnapshot!['game'];
      state.loaded.value = true;
    } catch (e) {
      print(
        'Error :' + e.toString(),
      );
    }
  }

  updateUserData(String id, String value, String updatedGame) async {
    setLoading(true);
    try{
      await FirebaseFirestore.instance.collection('users').doc(id).update({
        'isLose': value,
        'game' : updatedGame,
      }).then((value) {
        setLoading(false);
        CustomSnackBar.showSnackBar(
            'Success', 'Successfully updated data.', Icons.done_all);
        // Get.to(()=>HomeScreen());
      }).onError((error, stackTrace) {
        setLoading(false);
        CustomSnackBar.showSnackBar(
            'Error', 'Something went wrong.', Icons.error_outline_outlined);
      });

    }catch(e){
      CustomSnackBar.showSnackBar(
          'Error', e.toString(), Icons.error_outline_outlined);
    }
  }
}
