import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/models/user_model/user_model.dart';
import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/pages/add_users/state.dart';
import 'package:e_gamming_matcher/pages/all_users/state.dart';
import 'package:e_gamming_matcher/pages/splash_screen/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/style/snackbar.dart';

class AllUserScreenController extends GetxController {
  final state = AllUserScreenState();
  final firestore = FirebaseFirestore.instance.collection('users').snapshots();

  fetchData() {
    fetchTaken6Entries();
    fetchCallOfDutyEntries();
    fetchLudoEntries();
    fetchTakenTagEntries();
    fetchNFSEntries();
    fetchPubgEntries();
  }

  Future<void> fetchTaken6Entries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Taken-6')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.taken_6 = snapshot.docs.length;
    }
  }

  Future<void> fetchTakenTagEntries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'TakenTag')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.taken_tag = snapshot.docs.length;
    }
  }

  Future<void> fetchLudoEntries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Ludo')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.ludo = snapshot.docs.length;
    }
  }

  Future<void> fetchNFSEntries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'NFS')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.NFS = snapshot.docs.length;
    }
  }

  Future<void> fetchPubgEntries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Pubg')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.pubg = snapshot.docs.length;
    }
  }

  Future<void> fetchCallOfDutyEntries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Call-Of-Duty')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.call_of_duty = snapshot.docs.length;
    }
  }
}
