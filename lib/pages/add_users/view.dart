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
            contr: controller.state.rollNoController,
            descrip: 'RollNo',
            obsecure: false,
            icon: Icons.class_outlined,
            labelText: 'RollNo',
            readOnly: false,
          ),
          _buildSelectGame(),
          _buildSelectSemester(),
          _buildSelectDepartment(),
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
                            controller.state.semValue.value == 'Select' &&
                            controller.state.deptValue.value == 'Select' &&

                            controller.state.rollNoController.text.isEmpty) {
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
                            rollNo: controller.state.rollNoController.text
                                .trim()
                                .toString(),
                            game: controller.state.gameValue.value.toString(), department: '', semester: '',
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
  Widget _buildSelectSemester() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: 'Select Semester',
            textColor: AppColors.iconColor,
          ),
          Obx(
                () => DropdownButton(
              hint: TextWidget(
                title: controller.state.semValue.value.toString(),
                textColor: Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  child: TextWidget(
                    title: '1st',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '1st',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: '2nd',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '2nd',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: '3rd',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '3rd',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: '4th',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '4th',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: '5th',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '5th',
                ),

                DropdownMenuItem(
                  child: TextWidget(
                    title: '6th',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '6th',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: '7th',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '7th',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: '8th',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: '8th',
                ),

              ],
              onChanged: (value) {
                controller.state.semValue.value = value!;
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSelectDepartment() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: 'Select Department',
            textColor: AppColors.iconColor,
          ),
          Obx(
                () => DropdownButton(
              hint: TextWidget(
                title: controller.state.deptValue.value.toString(),
                textColor: Colors.black,
              ),
                  items: [
                    DropdownMenuItem(
                      value: 'IT',
                      child: TextWidget( title: 'IT'),
                    ),
                    DropdownMenuItem(
                      value: 'English',
                      child: TextWidget( title: 'English'),
                    ),
                    DropdownMenuItem(
                      value: 'Math',
                      child: TextWidget( title: 'Math'),
                    ),
                    DropdownMenuItem(
                      value: 'Physics',
                      child: TextWidget( title: 'Physics'),
                    ),
                    DropdownMenuItem(
                      value: 'Economics',
                      child: TextWidget( title: 'Economics'),
                    ),
                    DropdownMenuItem(
                      value: 'Biology',
                      child: TextWidget( title: 'Biology'),
                    ),
                    DropdownMenuItem(
                      value: 'Urdu',
                      child: TextWidget( title: 'Urdu'),
                    ),
                    DropdownMenuItem(
                      value: 'Chemistry',
                      child: TextWidget( title: 'Chemistry'),
                    ),

                    DropdownMenuItem(
                      value: 'Pak Studies',
                      child: TextWidget( title: 'Pak Studies'),
                    ),
                  ],

                  onChanged: (value) {
                controller.state.deptValue.value = value!;
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
