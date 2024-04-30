import 'package:flutter/material.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class OutLineActionButton extends StatelessWidget {
  const OutLineActionButton({
    required this.onPressed,
    this.title,
    this.margin,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.isLarge = false,
    this.disableBackgroundColor,
    this.backgroundColor,
    this.foregroundColor,
    this.alignment,
    Key? key,
  }) : super(key: key);

  final String? title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool isLarge;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final Color? foregroundColor;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (margin != null) ? margin : EdgeInsets.zero,
      alignment: alignment,
      child: isLarge
          ? Row(children: [Expanded(child: getOutLineButton())])
          : getOutLineButton(),
    );
  }

  Widget getOutLineButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        disabledBackgroundColor: disableBackgroundColor,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
        ),
        side: const BorderSide(color: ThemeColors.clrDivider),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        alignment: Alignment.center,
        textStyle: textStyle,
      ),
      onPressed: onPressed,
      child: Text(title!, style: textStyle),
    );
  }
}
