import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditUserState{

  RxString gameValue = 'Select'.obs;
  RxString semValue = 'Select'.obs;
  RxString deptValue = 'Select'.obs;
  RxString isLoseValue = 'false'.obs;

  Rx<bool> loaded = false.obs;

  RxBool loading = false.obs;

  // RxBool updateLoading = false.obs;


}