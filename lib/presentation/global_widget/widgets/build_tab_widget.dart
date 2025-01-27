import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/app_constant/app_colors.dart';

buildTabWidget(BuildContext context,{required String title,bool isActive=false,final Function()?onTap}){
  return          Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
        decoration: BoxDecoration(
            color:isActive? AppColors.kPrimary:AppColors.kWhite,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: isActive? Colors.transparent:Colors.black12,)

        ),
        child: Text(title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:isActive? AppColors.kWhite:AppColors.kBlack),),
      ),
    ),
  );
}