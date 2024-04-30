import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class NewTag extends StatelessWidget {
  const NewTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 20,
        width: 35,
        margin: const EdgeInsets.only(left: 8, top: 8),
        decoration: BoxDecoration(
          color: ThemeColors.clrBrightRed,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          "strNewCap".tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w900,
            color: ThemeColors.clrWhite,
          ),
        ),
      ),
    );
  }
}
