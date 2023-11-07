import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/style/snackbar.dart';
import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:e_gamming_matcher/pages/all_users/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/style/colors.dart';

class AllUserScreen extends GetView<AllUserScreenController> {
  const AllUserScreen({super.key});

  _buildListView(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot,
      int index, String value) {
    return controller.state.dropDownValue.value == 'All' ?
    Card(
      color: AppColors.iconColor,
      margin: EdgeInsets.only(right: 16, left: 16, top: 12),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: 'RollNo: ' + snapshot.data!.docs[index]['rollNo'].toString(),
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 8.0),
            TextWidget(
              title: 'Name: '+snapshot.data!.docs[index]['userName'].toString().capitalizeFirst.toString(),
              fontSize: 15,
            ),
            SizedBox(height: 8.0),
            TextWidget(
              title: 'Semester: ' +
                  snapshot.data!.docs[index]['semester'].toString(),
              fontSize: 15,
            ),
            SizedBox(height: 8.0),

            TextWidget(
              title: 'Department: ' +
                  snapshot.data!.docs[index]['department'].toString(),
              fontSize: 15,
            ),
            SizedBox(height: 8.0),
            TextWidget(
              title: 'Game To Play: ' +
                  snapshot.data!.docs[index]['game'].toString(),
              fontSize: 15,
            ),
          ],
        ),
      ),
    )
        : snapshot.data!.docs[index]['game'].toString()==value ?
    Card(
      color: AppColors.iconColor,
      margin: EdgeInsets.only(right: 16, left: 16, top: 12),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: 'RollNo: ' + snapshot.data!.docs[index]['rollNo'].toString(),
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 8.0),
            TextWidget(
              title: 'Name: '+snapshot.data!.docs[index]['userName'].toString().capitalizeFirst.toString(),
              fontSize: 15,
            ),
            SizedBox(height: 8.0),
            TextWidget(
              title: 'Semester: ' +
                  snapshot.data!.docs[index]['semester'].toString(),
              fontSize: 15,
            ),
            SizedBox(height: 8.0),

            TextWidget(
              title: 'Department: ' +
                  snapshot.data!.docs[index]['department'].toString(),
              fontSize: 15,
            ),
            SizedBox(height: 8.0),
            TextWidget(
              title: 'Game To Play: ' +
                  snapshot.data!.docs[index]['game'].toString(),
              fontSize: 15,
            ),
          ],
        ),
      ),
    )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            fontSize: 19,
            title: 'All Users',
          ),
          backgroundColor: AppColors.iconColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: AppColors.textColor,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
                60.0), // set the height of the custom app bar bottom
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      title: "Apply Filter",
                      // textColor: LightAppColor.bgColor,
                      fontSize: 16,
                    ),
                    Obx(() {
                      return DropdownButton(
                          iconEnabledColor: Colors.white,
                          hint: TextWidget(
                            title:
                                controller.state.dropDownValue.value.toString(),
                            textColor: Colors.white,
                            fontSize: 16,
                          ),
                          items: [
                            DropdownMenuItem(
                              child: TextWidget(
                                title: 'Taken Tag',
                                fontSize: 14,
                                textColor: Colors.black,
                              ),
                              value: 'TakenTag',
                            ),
                            DropdownMenuItem(
                              child: TextWidget(
                                title: 'Taken-6',
                                fontSize: 14,
                                textColor: Colors.black,
                              ),
                              value: 'Taken-6',
                            ),
                            DropdownMenuItem(
                              child: TextWidget(
                                title: 'Call Of Duty',
                                fontSize: 14,
                                textColor: Colors.black,
                              ),
                              value: 'Call-Of-Duty',
                            ),
                            DropdownMenuItem(
                              child: TextWidget(
                                title: 'NFS',
                                fontSize: 14,
                                textColor: Colors.black,
                              ),
                              value: 'NFS',
                            ),
                            DropdownMenuItem(
                              child: TextWidget(
                                title: 'Ludo',
                                fontSize: 14,
                                textColor: Colors.black,
                              ),
                              value: 'Ludo',
                            ),
                            DropdownMenuItem(
                              child: TextWidget(
                                title: 'Pubg',
                                fontSize: 14,
                                textColor: Colors.black,
                              ),
                              value: 'Pubg',
                            ),
                          ],
                          onChanged: (value) {
                            controller.state.dropDownValue.value = value!;
                          });
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.firestore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(color: AppColors.iconColor,),);
                  }
                  if(snapshot.hasError){
                    CustomSnackBar.showSnackBar('Error', snapshot.error.toString(),Icons.error_outline_outlined);
                    return Container(child: Text("Snapshot error"),);
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text('No Items in the Database'),
                    );
                  }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => _buildListView(
                            context,
                            snapshot,
                            index,
                            controller.state.dropDownValue.value.toString(),
                          ),
                        );
                      },
                    );
                  }

              ),
            ),
          ),
        ));
  }
}
