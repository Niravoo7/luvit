import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        children: [
          Image.asset(IconConstants.icLocation, width: 28, height: 28),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              StringConstants.strSadGiraffeWithLong.tr,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(width: 5),
          likeLabel(),
          Image.asset(IconConstants.icNotification, width: 40, height: 40),
        ],
      ),
    );
  }

  Widget likeLabel() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.clrCombinePureWhite),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(IconConstants.icStar1, height: 20, width: 20),
          const SizedBox(width: 5),
          const Text(StringConstants.strValue),
        ],
      ),
    );
  }
}
