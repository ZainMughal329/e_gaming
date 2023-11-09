import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gamming_matcher/component/models/user_model/user_model.dart';
import 'package:e_gamming_matcher/component/style/button.dart';
import 'package:e_gamming_matcher/component/style/snackbar.dart';
import 'package:e_gamming_matcher/component/style/text_widget.dart';
import 'package:e_gamming_matcher/pages/add_users/controller.dart';
import 'package:e_gamming_matcher/pages/add_users/widgets/add_user_input_field.dart';
import 'package:e_gamming_matcher/pages/matching_screens/edit_user/controller.dart';
import 'package:e_gamming_matcher/pages/splash_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/style/colors.dart';

class EditUserScreen extends GetView<EditUserScreenController> {
  String id;

  EditUserScreen({super.key, required this.id});

  final controller =
      Get.put<EditUserScreenController>(EditUserScreenController());

  Widget _buildForm() {
    final TextEditingController nameController = TextEditingController(
      text: controller.userModel!.userName.toString(),
    );
    final TextEditingController phoneController = TextEditingController(
      text: controller.userModel!.phone.toString(),
    );
    final TextEditingController rollNoController = TextEditingController(
      text: controller.userModel!.rollNo.toString(),
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddUserInputTextField(
            contr: nameController,
            hint: controller.userModel!.userName.toString(),
            descrip: 'Name',
            obsecure: false,
            icon: Icons.drive_file_rename_outline,
            labelText: 'Name',
            readOnly: true,
          ),
          AddUserInputTextField(
            contr: rollNoController,
            descrip: 'RollNo',
            obsecure: false,
            icon: Icons.class_outlined,
            labelText: 'RollNo',
            keyboardType: TextInputType.number,
            readOnly: true,
          ),
          AddUserInputTextField(
            contr: phoneController,
            descrip: 'PhoneNo',
            keyboardType: TextInputType.number,
            obsecure: false,
            icon: Icons.phone,
            labelText: 'PhoneNo',
            readOnly: true,
          ),
          _buildIsLose(),
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
                      title: 'Update',
                      onPress: () {
                        UserModel user = UserModel(
                          userName: nameController.text.toString(),
                          phone: phoneController.text.toString(),
                          rollNo: rollNoController.text.toString(),
                          game: controller.state.gameValue.value.toString(),
                          isLose: controller.state.isLoseValue.value.toString(),
                          department:
                              controller.state.deptValue.value.toString(),
                          semester: controller.state.semValue.value.toString(),
                        );
                        controller.updateUserData(
                          id,
                          controller.state.isLoseValue.value.toString(),
                        );
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
                  child: TextWidget(
                    title: 'IT',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'English',
                  child: TextWidget(
                    title: 'English',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Math',
                  child: TextWidget(
                    title: 'Math',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Physics',
                  child: TextWidget(
                    title: 'Physics',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Economics',
                  child: TextWidget(
                    title: 'Economics',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Biology',
                  child: TextWidget(
                    title: 'Biology',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Urdu',
                  child: TextWidget(
                    title: 'Urdu',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Chemistry',
                  child: TextWidget(
                    title: 'Chemistry',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Pak Studies',
                  child: TextWidget(
                    title: 'Pak Studies',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'PolSciences',
                  child: TextWidget(
                    title: 'Pol Sciences',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Education',
                  child: TextWidget(
                    title: 'Education',
                    textColor: Colors.black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Islamiyat',
                  child: TextWidget(
                    title: 'Islamiyat',
                    textColor: Colors.black,
                  ),
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

  Widget _buildIsLose() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: 'Is Lose',
            textColor: AppColors.iconColor,
          ),
          Obx(
            () => DropdownButton(
              hint: TextWidget(
                title: controller.state.isLoseValue.value.toString(),
                textColor: Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  child: TextWidget(
                    title: 'false',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: 'false',
                ),
                DropdownMenuItem(
                  child: TextWidget(
                    title: 'true',
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                  value: 'true',
                ),
              ],
              onChanged: (value) {
                controller.state.isLoseValue.value = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchUsersDetails(id);
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            fontSize: 19,
            title: 'Edit User',
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
              child: Obx(() => controller.state.loaded == false
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.iconColor,
                      ),
                    )
                  : _buildForm()),
            ),
          ),
        ));
  }
}
