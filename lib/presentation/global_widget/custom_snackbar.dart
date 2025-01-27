import 'package:get/get.dart';
import 'package:flutter/material.dart';




successSnackBar({required String title, required String message}) {
  return Get.snackbar(title, message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      duration: const Duration(seconds: 2));
}

failedSnackBar({required String title, required String message}) {
  return Get.snackbar(title, message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      duration: const Duration(seconds: 3));
}


