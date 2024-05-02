import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class NoStoryWidget extends StatelessWidget {
  const NoStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              StringConstants.strIAmReadyToRecommend.tr,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              StringConstants.strEveryDayIWillIntroduceNewFriends.tr,
              style:
                  const TextStyle(color: ThemeColors.clrDarkGray, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
