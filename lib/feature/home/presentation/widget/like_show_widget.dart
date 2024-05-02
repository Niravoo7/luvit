import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class LikeShowWidget extends StatelessWidget {
  const LikeShowWidget({super.key, this.like = 0});
  final int like;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern().format(like);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ThemeColors.clrBlack,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            IconConstants.icStarLike,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 5),
          Text(formatter),
        ],
      ),
    );
  }
}
