import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:e_gamming_matcher/pages/search/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/style/colors.dart';
import '../matching_screens/edit_user/view.dart';

class SearchScreen extends GetView<SearchBarController> {
  const SearchScreen({super.key});

  Widget _searchBarView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: GetBuilder<SearchBarController>(
        builder: (con) {
          return TextField(
            onChanged: (value) {
              controller.filteredUsers(value);
              print(
                'length of filtered is : ' +
                    controller.filterUsersList.length.toString(),
              );
            },
            controller: controller.state.searchController,
            textInputAction: TextInputAction.search,

            keyboardType: TextInputType.text,
            cursorColor: AppColors.iconColor,
            // focusNode: focNode,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.iconColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.iconColor,
                ),
              ),

              suffixIcon: Icon(
                Icons.search,
                color: AppColors.iconColor,
              ),
              // border: InputBorder.none,

              hintText: 'Search items here...',
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  _buildCard(String userName, rollNo, status, phone, dept, sem, game, id) {
    return InkWell(
      onLongPress: () {
        Get.to(
          () => EditUserScreen(id: id),
        );
      },
      child: Card(
        color: AppColors.iconColor,
        margin: EdgeInsets.only(right: 16, left: 16, top: 12),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                title: 'RollNo: ' + rollNo.toString(),
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8.0),
              TextWidget(
                title:
                    'Name: ' + userName.toString().capitalizeFirst.toString(),
                fontSize: 15,
              ),
              SizedBox(height: 8.0),
              TextWidget(
                title: 'Semester: ' + sem.toString(),
                fontSize: 15,
              ),
              SizedBox(height: 8.0),
              TextWidget(
                title: 'Department: ' + dept.toString(),
                fontSize: 15,
              ),
              SizedBox(height: 8.0),
              TextWidget(
                title: 'Game To Play: ' + game.toString(),
                fontSize: 15,
              ),
              SizedBox(height: 8.0),
              TextWidget(
                title: 'Lost: ' + status.toString(),
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: _searchBarView(),
        // backgroundColor: AppColors.iconColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.filterUsersList.length != 0
                  ? ListView.builder(
                      itemCount: controller.filterUsersList.length,
                      itemBuilder: (context, index) {
                        var item = controller.filterUsersList[index];
                        print(
                          'item is : ' + item.toString(),
                        );
                        return _buildCard(
                          item['userName'],
                          item['rollNo'],
                          item['isLose'],
                          item['phone'],
                          item['department'],
                          item['semester'],
                          item['game'],
                          item['id'],
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            title: 'No item here.',
                            textColor: Colors.black,
                            fontSize: 25,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
