import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({required this.image, required this.onTap, super.key});

  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: ThemeColors.clrTransparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),
      child: IconButton(
        onPressed: onTap,
        iconSize: 24.sp,
        icon: ImageIcon(
          AssetImage(image),
          color: isDark ? ThemeColors.clrWhite : ThemeColors.clrBlack,
        ),
      ),
    );
  }
}
