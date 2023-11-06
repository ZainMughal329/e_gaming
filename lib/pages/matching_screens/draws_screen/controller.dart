import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/pages/matching_screens/draws_screen/state.dart';
import 'package:get/get.dart';

class DrawsScreenController extends GetxController {
  final state = DrawsScreenState();
  final ref=FirebaseFirestore.instance.collection('users');
}