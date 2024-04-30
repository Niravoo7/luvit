import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class BackButtonCS extends StatelessWidget {
  const BackButtonCS({this.onTap, this.color, this.icon, super.key});

  final Function()? onTap;
  final Color? color;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: ThemeColors.clrTransparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),
      child: IconButton(
        onPressed: onTap ?? Get.back,
        iconSize: 24.sp,
        icon: icon ??
            Icon(
              Icons.arrow_back_ios_new_rounded,
              color: color ??
                  (isDark ? ThemeColors.clrWhite : ThemeColors.clrBlack),
            ),
      ),
    );
  }
}
