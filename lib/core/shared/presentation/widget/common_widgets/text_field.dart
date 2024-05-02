import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/core/library/basic_utils/basic_utils.dart';
import 'package:luvit/core/utils/generic_enums.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.hint,
    this.isObscureText = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.textFieldType,
    this.prefixIconImage,
    this.suffixIconImage,
    this.prefixOnTap,
    this.suffixOnTap,
    this.onChanges,
    this.prefixIcon,
    this.suffixIcon,
    this.matchPasswordText,
    this.letterSpacing,
    this.maxLines,
    this.textInputFormatter,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String? hint;
  final bool isObscureText;
  final bool enabled;
  final String? suffixIconImage;
  final String? prefixIconImage;
  final Function()? suffixOnTap;
  final Function()? prefixOnTap;
  final Function(String)? onChanges;
  final TextInputType? keyboardType;
  final TextFieldType? textFieldType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? matchPasswordText;
  final double? letterSpacing;
  final int? maxLines;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final FocusNode _focus = FocusNode();
  bool isError = false;
  final borderRadius = BorderRadius.circular(30);

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      controller: widget.controller,
      scrollPadding: const EdgeInsets.only(bottom: 40),
      textCapitalization: TextCapitalization.sentences,
      inputFormatters: widget.textInputFormatter,
      obscureText: widget.isObscureText,
      focusNode: _focus,
      maxLines: widget.maxLines ?? 1,
      enabled: widget.enabled,
      style: TextStyle(
        color: isDark ? ThemeColors.clrWhite : ThemeColors.clrBlack,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        letterSpacing: widget.letterSpacing,
      ),
      cursorColor: isDark ? ThemeColors.clrWhite : ThemeColors.clrBlack,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      onChanged: (data) {
        if (widget.onChanges != null) {
          widget.onChanges!(data);
        }
        validate(data);
      },
      keyboardAppearance: isDark ? Brightness.dark : Brightness.light,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        isDense: true,
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: ThemeColors.clrHint,
          letterSpacing: 1,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: _focus.hasFocus
            ? isDark
                ? ThemeColors.clrBlack50
                : ThemeColors.clrWhite
            : isDark
                ? ThemeColors.clrBlack50
                : ThemeColors.clrFill,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isError ? ThemeColors.clrError : ThemeColors.accentColor,
          ),
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isError ? ThemeColors.clrError : ThemeColors.clrTransparent,
          ),
          borderRadius: borderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.clrTransparent),
          borderRadius: borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.clrError),
          borderRadius: borderRadius,
        ),
        prefixIcon: widget.prefixIcon != null || widget.prefixIconImage != null
            ? Container(
                margin: const EdgeInsets.only(left: 24, right: 12),
                child: UnconstrainedBox(
                  child: InkWell(
                    onTap: widget.prefixOnTap,
                    child: widget.prefixIconImage != null
                        ? Image.asset(
                            widget.prefixIconImage!,
                            height: 20.sp,
                            width: 20.sp,
                            color: _focus.hasFocus
                                ? isError
                                    ? ThemeColors.clrError
                                    : isDark
                                        ? ThemeColors.clrWhite
                                        : ThemeColors.clrAccentBlack
                                : isDark
                                    ? ThemeColors.clrWhite
                                    : ThemeColors.clrAccentBlack,
                          )
                        : Icon(
                            widget.prefixIcon,
                            size: 20.sp,
                            color: _focus.hasFocus
                                ? isError
                                    ? ThemeColors.clrError
                                    : isDark
                                        ? ThemeColors.clrWhite
                                        : ThemeColors.clrAccentBlack
                                : isDark
                                    ? ThemeColors.clrWhite
                                    : ThemeColors.clrAccentBlack,
                          ),
                  ),
                ),
              )
            : null,
        suffixIcon: widget.suffixIcon != null || widget.suffixIconImage != null
            ? Container(
                margin: const EdgeInsets.only(right: 24, left: 12),
                child: UnconstrainedBox(
                  child: InkWell(
                    onTap: widget.suffixOnTap,
                    child: widget.suffixIconImage != null
                        ? Image.asset(
                            widget.suffixIconImage!,
                            height: 20.sp,
                            width: 20.sp,
                            color: _focus.hasFocus
                                ? isError
                                    ? ThemeColors.clrError
                                    : isDark
                                        ? ThemeColors.clrWhite
                                        : ThemeColors.clrAccentBlack
                                : isDark
                                    ? ThemeColors.clrWhite
                                    : ThemeColors.clrAccentBlack,
                          )
                        : Icon(
                            widget.suffixIcon,
                            size: 20.sp,
                            color: _focus.hasFocus
                                ? isError
                                    ? ThemeColors.clrError
                                    : isDark
                                        ? ThemeColors.clrWhite
                                        : ThemeColors.clrAccentBlack
                                : isDark
                                    ? ThemeColors.clrWhite
                                    : ThemeColors.clrAccentBlack,
                          ),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  void validate(String text) {
    if (widget.textFieldType == null && text.isEmpty) {
      setState(resetError);
    } else {
      if (StringUtils.isNotNullOrEmpty(text)) {
        if (widget.textFieldType == TextFieldType.email) {
          if (!GetUtils.isEmail(text)) {
            isError = true;
          } else {
            resetError();
          }
        } else if (widget.textFieldType == TextFieldType.password) {
          if (text.length < 8) {
            isError = true;
          } else {
            resetError();
          }
        } else if (widget.textFieldType == TextFieldType.matchPassword) {
          if (text.length < 8) {
            isError = true;
          } else if (!StringUtils.equalsIgnoreCase(
            text,
            widget.matchPasswordText!,
          )) {
            isError = true;
          } else {
            resetError();
          }
        } else if (widget.textFieldType == TextFieldType.name) {
          if (text.length < 2) {
            isError = true;
          } else {
            resetError();
          }
        }
      } else {
        resetError();
      }
      setState(() {});
    }
  }

  void resetError() {
    if (isError) {
      isError = !isError;
    }
  }
}
