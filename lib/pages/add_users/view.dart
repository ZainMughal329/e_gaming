import 'package:e_gamming_matcher/component/models/user_model/user_model.dart';
import 'package:e_gamming_matcher/component/style/button.dart';
import 'package:e_gamming_matcher/component/style/snackbar.dart';
import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:e_gamming_matcher/pages/add_users/controller.dart';
import 'package:e_gamming_matcher/pages/add_users/widgets/add_user_input_field.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/style/colors.dart';

class AddUserScreen extends GetView<AddUserScreenController> {
  const AddUserScreen({super.key});

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddUserInputTextField(
            contr: controller.state.nameController,
            descrip: 'Name',
            obsecure: false,
            icon: Icons.drive_file_rename_outline,
            labelText: 'Name',
            readOnly: false,
          ),
          AddUserInputTextField(
            contr: controller.state.phoneController,
            descrip: 'PhoneNo',
            obsecure: false,
            icon: Icons.phone,
            labelText: 'PhoneNo',
            readOnly: false,
          ),
          AddUserInputTextField(
            contr: controller.state.semesterController,
            descrip: 'Semester',
            obsecure: false,
            icon: Icons.class_outlined,
            labelText: 'Semester',
            readOnly: false,
          ),
          _buildSelectGame(),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => Container(
              child: controller.state.loading.value == false
                  ? RoundButton(
                      title: 'Add User',
                      onPress: () {
                        if (controller.state.nameController.text.isEmpty &&
                            controller.state.gameValue.value == 'Select' &&
                            controller.state.semesterController.text.isEmpty) {
                          CustomSnackBar.showSnackBar(
                              'Error', 'Fill all fields', Icons.info_outline);
                        } else {
                          UserModel user = UserModel(
                            userName: controller.state.nameController.text
                                .trim()
                                .toString(),
                            phone: controller.state.phoneController.text
                                .trim()
                                .toString(),
                            semester: controller.state.semesterController.text
                                .trim()
                                .toString(),
                            game: controller.state.gameValue.value.toString(),
                          );
                          controller.addUserDataToFirebase(user);
                        }
                      },
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectGame() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: 'Select Game',
            textColor: AppColors.iconColor,
          ),
          Obx(
            () => DropdownButton(
              hint: TextWidget(
                title: controller.state.gameValue.value.toString(),
                textColor: Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  child: TextWidget(
                    title: 'Taken Tag',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: 'Taken Tag',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: 'Taken 7',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: 'Taken 7',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: 'Call Of Duty',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: 'Call Of Duty',
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
              ],
              onChanged: (value) {
                controller.state.gameValue.value = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            fontSize: 19,
            title: 'Add User',
          ),
          backgroundColor: AppColors.iconColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color: AppColors.textColor,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: _buildForm(),
            ),
          ),
        ));
  }
}
