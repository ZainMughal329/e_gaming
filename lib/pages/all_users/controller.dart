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
    remainingPlayers();
    remainingPlayersCOD();
    remainingPlayersLudo();
    remainingPlayersNFS();
    remainingPlayersTaken6();
    remainingPlayersTakenTag();
    remainingPlayersPubg();
    lostPlayers();
    playersLostPubg();
    playersLostTakenTag();
    playersLostNFS();
    playersLostTaken6();
    playersLostCOD();
    playersLostLudo();

  }

  Future<void> fetchTaken6Entries() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Taken-6')
        .get();
    QuerySnapshot lostSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Taken-6')
        .where('isLose', isEqualTo: 'true')
        .get();
    QuerySnapshot remSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Taken-6')
        .where('isLose', isEqualTo: 'false')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.taken_6 = snapshot.docs.length;
    }
    if (lostSnapshot.docs.isNotEmpty) {
      state.taken_6_lost = lostSnapshot.docs.length;
    }
    if (remSnapshot.docs.isNotEmpty) {
      state.taken_6_lost = remSnapshot.docs.length;
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

  Future<void> remainingPlayers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemaining = snapshot.docs.length;
    }
  }

  Future<void> remainingPlayersLudo() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .where('game', isEqualTo: 'Ludo')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemainingLudo = snapshot.docs.length;
    }
  }

  Future<void> remainingPlayersPubg() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .where('game', isEqualTo: 'Pubg')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemainingPubg = snapshot.docs.length;
    }
  }

  Future<void> remainingPlayersTaken6() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .where('game', isEqualTo: 'Taken-6')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemainingTaken6 = snapshot.docs.length;
    }
  }

  Future<void> remainingPlayersTakenTag() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .where('game', isEqualTo: 'TakenTag')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemainingTakenTag = snapshot.docs.length;
    }
  }

  Future<void> remainingPlayersCOD() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .where('game', isEqualTo: 'Call-Of-Duty')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemainingCOD = snapshot.docs.length;
    }
  }

  Future<void> remainingPlayersNFS() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'false')
        .where('game', isEqualTo: 'NFS')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersRemainingNFS = snapshot.docs.length;
    }
  }

  Future<void> lostPlayers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLost = snapshot.docs.length;
    }
  }

  Future<void> playersLostLudo() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Ludo')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLostLudo = snapshot.docs.length;
    }
  }

  Future<void> playersLostTaken6() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Taken-6')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLostTaken6 = snapshot.docs.length;
    }
  }

  Future<void> playersLostTakenTag() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'TakenTag')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLostTakenTag = snapshot.docs.length;
    }
  }

  Future<void> playersLostPubg() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Pubg')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLostPubg = snapshot.docs.length;
    }
  }

  Future<void> playersLostNFS() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'NFS')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLostNFS = snapshot.docs.length;
    }
  }

  Future<void> playersLostCOD() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('game', isEqualTo: 'Call-Of-Duty')
        .where('isLose', isEqualTo: 'true')
        .get();
    if (snapshot.docs.isNotEmpty) {
      state.playersLostCOD = snapshot.docs.length;
    }
  }

}
