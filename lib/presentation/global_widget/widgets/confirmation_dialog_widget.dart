import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_force/presentation/global_widget/snack_bar_taosts.dart';

import '../../../app/app_constant/app_colors.dart';
import '../custom_button.dart';

void showConfirmDialog(
  BuildContext context, {
  Function()? deleteOnTap,
  required RxBool isLoading,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        if (!isLoading.value) Get.back();
                      },
                      child: Icon(Icons.close, color: AppColors.kGrey)),
                ),
                Text("Are you sure?".tr,
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Do you really want to delete these records? This process cannot be undone."
                      .tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      width: 120.0,
                      color: AppColors.kGrey.withOpacity(0.1),
                      text: Text("Cancel".tr),
                      onPressed: () {},
                    ),
                    Obx(
                      () => isLoading.value
                          ? customCircularIndicator()
                          : CustomButton(
                              width: 120.0,
                              color: AppColors.kRed,
                              text: Text("Delete".tr),
                              onPressed: deleteOnTap,
                            ),
                    )
                  ],
                ).paddingSymmetric(vertical: 15.0)
              ],
            ),
          ),
        ),
      );
    },
  );
}
