import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_constant/app_colors.dart';

buildHomeWidget({
  required BuildContext context,
  required String title,
  required String iconPath,
  final Function()?onTap,
}) {
  return Expanded(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kPrimary),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              height: 70.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    ).paddingOnly(top: Get.height * 0.03),
  );
}