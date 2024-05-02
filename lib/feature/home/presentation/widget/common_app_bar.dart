import 'package:flutter/material.dart';
import 'package:luvit/core/constants/image_constants.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          IconConstants.icLocation,
          width: 28,
          height: 28,
        ),
        Text("목이길어슬픈기린님의 새로운 스팟")
      ],
    );
  }
}
