import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luvit/core/shared/presentation/widget/common_widgets/back_button.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    this.onPressed,
    this.title,
    this.leadingColor,
    this.foregroundColor,
    this.backgroundColor,
    this.isBackEnable = true,
    this.children,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(0.065.sh);
  final Function()? onPressed;
  final String? title;
  final bool isBackEnable;
  final Color? leadingColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? children;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackEnable
          ? BackButtonCS(
              onTap: onPressed,
              color: leadingColor,
              icon: icon,
            )
          : null,
      elevation: 0,
      automaticallyImplyLeading: isBackEnable,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: children,
    );
  }
}
