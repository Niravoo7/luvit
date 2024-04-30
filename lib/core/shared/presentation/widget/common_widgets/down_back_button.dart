import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class DownBackButton extends StatelessWidget {
  const DownBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: const RotatedBox(
        quarterTurns: -1,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 30,
          color: ThemeColors.clrWhite,
        ),
      ),
    );
  }
}
