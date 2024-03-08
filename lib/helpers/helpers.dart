import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

void showWebSnackBar(String title, String message, {bool isWarning = false}) {
  Get.snackbar('Log Out', 'User signed out',
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      colorText: Colors.white,
      backgroundColor: isWarning ? Colors.red : Colors.black);
}

String formatDate(DateTime date) {
  return DateFormat('MMMM dd, yyyy').format(date);
}
