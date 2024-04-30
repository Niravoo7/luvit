import 'package:flutter/material.dart';
import 'package:luvit/core/constants/theme_constants.dart';

class SoundPremiumTag extends StatelessWidget {
  const SoundPremiumTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 25,
        width: 25,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ThemeColors.clrPremiumLight,
              ThemeColors.clrPremiumDark,
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.lock,
          color: ThemeColors.clrWhite,
          size: 15,
        ),
      ),
    );
  }
}
