import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserScreenState{
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();

  RxString gameValue = 'Select'.obs;
  RxString semValue = 'Select'.obs;
  RxString deptValue = 'Select'.obs;

  RxBool loading = false.obs;


}