import 'package:e_gamming_matcher/component/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSnackBar (String title, String msg,IconData iconData){
    String message = extractErrorMessage(msg);
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.iconColor, // dark grey background
      colorText: AppColors.textColor,
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor, // for a splash of color
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textColor,
        ),
      ),
      icon: Icon(
        iconData,
        color: AppColors.textColor,
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      margin: EdgeInsets.all(10),
      forwardAnimationCurve: Curves.easeOutExpo,
      reverseAnimationCurve: Curves.easeInOut,
    );


  }


  static String extractErrorMessage(String error) {
    if (error.contains(']')) {
      return error.split(']').last.trim();
    }
    return error; // return the original error if no "]" is found
  }
}