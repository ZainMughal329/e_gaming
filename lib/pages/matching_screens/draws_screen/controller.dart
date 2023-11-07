import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/state.dart';
import 'package:get/get.dart';

class DrawsScreenController extends GetxController {
  final state = DrawsScreenState();
  final ref=FirebaseFirestore.instance.collection('users');


  refreshRandomData(String game) async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firestore.collection('users');
    try {
      QuerySnapshot snapshot = await collectionReference.where('game' , isEqualTo: game).get();
      int dataLength = snapshot.docs.length;
      Random random = Random();
      do {
        state.x.value = random.nextInt(dataLength);
      }while(state.x.value == 0);
      do{
        state.y.value = random.nextInt(dataLength);
      }while(state.y == state.x || state.y.value == 0);
      print('y : ' + state.y.value.toString());
      print('x : ' + state.x.value.toString());

    }catch(e) {

    }
  }

  deleteUser(String id) async{
    await FirebaseFirestore.instance.collection('users').doc(id).delete().then((value) {
      print('deleted');
    }).onError((error, stackTrace) {
      print('error');
    });
  }
}