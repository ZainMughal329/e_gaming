import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/style/snackbar.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawsScreenController extends GetxController {
  final state = DrawsScreenState();
  final ref=FirebaseFirestore.instance.collection('users');

  void setLoading(bool val){
    state.loading.value = val;
  }


  refreshRandomData(String game) async{
    setLoading(true);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firestore.collection('users');
    try {
      QuerySnapshot snapshot = await collectionReference.where('game' , isEqualTo: game).where('isLose' , isEqualTo : 'false').get();
      int dataLength = snapshot.docs.length;
      print('snapshot length'+ dataLength.toString());
      Random random = Random();

      if(snapshot.docs.length > 2){
        do {
          state.x.value = random.nextInt(dataLength);
        }while(state.x.value == 0);
        do{
          state.y.value = random.nextInt(dataLength);
        }while(state.y == state.x || state.y.value == 0);
      }else if(snapshot.docs.length == 2) {
        state.x.value = 0;
        state.y.value = 1;
      }else if(snapshot.docs.length < 2){
        state.x.value = 0;
        state.y.value = 0;
      }
      setLoading(false);
      print('x : ' + state.x.value.toString());
      print('y : ' + state.y.value.toString());


    }catch(e) {
      setLoading(false);
      CustomSnackBar.showSnackBar('Error', e.toString(), Icons.info_outline);
    }
  }

  updateUser (String id, String game) async{
    await ref.doc(id).update({
      'isLose' : 'true'
    }).then((value){
      refreshRandomData(game);
    }).onError((error, stackTrace){
      CustomSnackBar.showSnackBar('Error', error.toString(), Icons.info_outline);
    });
  }

  deleteUser(String id) async{
    await FirebaseFirestore.instance.collection('users').doc(id).delete().then((value) {
      print('deleted');
    }).onError((error, stackTrace) {
      print('error');
    });
  }
}