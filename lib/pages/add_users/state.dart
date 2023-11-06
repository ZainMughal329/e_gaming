import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserScreenState{
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  RxString gameValue = 'Select'.obs;
  RxBool loading = false.obs;


}