import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/app_constant/app_colors.dart';

customToastView({required String title}) {
  FocusManager.instance.primaryFocus?.unfocus();
  return Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // backgroundColor: AppColors.kPrimaryDark,
      textColor: Colors.white,
      fontSize: 16.0);
}

customCircularIndicator() {
  return Center(
    child: CircularProgressIndicator(color: AppColors.kPrimary),
  );
}
