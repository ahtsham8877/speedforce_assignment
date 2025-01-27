import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speed_force/app/app_constant/app_colors.dart';

class UserWidget extends StatelessWidget {
  final String title;
  final String subTitle;
   UserWidget({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: const Border(
            left: BorderSide(color: AppColors.kPrimary, width: 13.0),
            bottom: BorderSide(color: AppColors.kPrimary, width: 1.0),
            top: BorderSide(color: AppColors.kPrimary, width: 1.0),
            right: BorderSide(color: AppColors.kPrimary, width: 1.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title} ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            '${subTitle} ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
