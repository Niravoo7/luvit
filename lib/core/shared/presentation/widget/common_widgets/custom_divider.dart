import 'package:flutter/material.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height,
    this.color,
    this.padding,
    this.isExpanded = false,
  });

  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isExpanded
        ? Expanded(
            child: Container(
              height: height ?? 0.5,
              padding: padding,
              color: color ??
                  (isDark ? ThemeColors.clrWhite : ThemeColors.clrAccentBlack)
                      .withOpacity(0.6),
            ),
          )
        : Container(
            height: height ?? 0.5,
            padding: padding,
            width: double.maxFinite,
            color: color ??
                (isDark ? ThemeColors.clrWhite : ThemeColors.clrAccentBlack)
                    .withOpacity(0.6),
          );
  }
}
