import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/routes/route_name.dart';
import 'package:e_gamming_matcher/pages/search/state.dart';
import 'package:e_gamming_matcher/pages/splash_screen/state.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController {
  final state = SearchState();

  RxList<DocumentSnapshot> allUsers = RxList<DocumentSnapshot>();
  RxList<DocumentSnapshot> filterUsersList = RxList<DocumentSnapshot>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllUsersData();
  }

  fetchAllUsersData() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    print('length is : ' + querySnapshot.docs.length.toString());
    allUsers.assignAll(querySnapshot.docs);
  }

  filteredUsers(String query) async {
    final lowerCaseQuery = query.toLowerCase();
    List<DocumentSnapshot> results = [];
    if (query.isEmpty) {
      results = [];
    } else {
      results = allUsers
          .where((ele) =>
              ele['userName']
                  .toString()
                  .toLowerCase()
                  .contains(lowerCaseQuery) ||
              ele['rollNo'].toString().toLowerCase().contains(lowerCaseQuery))
          .toList();
    }
    filterUsersList.value = results;
    update();
  }
}
