import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/models/user_model/user_model.dart';
import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/pages/add_users/state.dart';
import 'package:e_gamming_matcher/pages/splash_screen/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/style/snackbar.dart';

class AddUserScreenController extends GetxController {
  final state = AddUserScreenState();

  setLoading(value) {
    state.loading.value = value;
  }

  addUserDataToFirebase(UserModel userModel) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      setLoading(true);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set(
            userModel.toJson(),
          )
          .then((value) {
        updateId(id);
        clearControllers();
      }).onError((error, stackTrace) {
        CustomSnackBar.showSnackBar(
            'Error', 'Something went wrong', Icons.info_outline);
        setLoading(false);
      });
    } catch (e) {
      CustomSnackBar.showSnackBar(
          'Error', 'Something went wrong', Icons.info_outline);
      setLoading(false);
    }
  }

  updateId(String id) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'id': id,
    }).then((value) {
      CustomSnackBar.showSnackBar(
          'Success', 'User Registered Successfully', Icons.done_all);
      setLoading(false);
    }).onError((error, stackTrace){
      CustomSnackBar.showSnackBar('Error', error.toString(), Icons.info_outline);
    });
  }

  clearControllers() {
    state.gameValue.value = 'Select';
    state.deptValue.value = 'Select';
    state.semValue.value = 'Select';

    state.rollNoController.clear();
    state.nameController.clear();
    state.phoneController.clear();
  }
}
