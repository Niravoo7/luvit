import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeColors {
  static const Color clrBlack = Color(0xFF000000);
  static const Color clrBlack50 = Color(0xFF151513);
  static const Color clrBlack100 = Color(0xFF0B1110);
  static const Color clrBlack400 = Color(0xFF101717);
  static const Color clrAccentBlack = Color(0xFF1A1639);
  static const Color accentColor = Color(0xFF2C71ED);
  static const Color tabSelectedColor = Color(0xFFFF016B);
  static const Color primaryColor = Color(0xFFABC6F8);
  static const Color secondColor = Color(0xFF748299);
  static const Color second50Color = Color(0xFFCCDEFF);
  static const Color accent100Color = Color(0xFFA8A7B4);
  static const Color accent200Color = Color(0xFF8281A6);
  static const Color clrHint = Color(0xFF9B9AB7);
  static const Color clrFill = Color(0xFFF6F6F8);
  static const Color clrScaffoldBG = Color(0xFFF0F4FB);
  static const Color clrWhite = Color(0xFFffffff);
  static const Color clrWhite50 = Color(0xFFEBF2FF);
  static const Color clrWhite100 = Color(0xFFE2E3E7);
  static const Color clrDivider = Color(0xFFD4D3EA);
  static const Color clrGrey50 = Color(0xFF666666);
  static const Color clrGrey100 = Color(0xFFE6E6E6);
  static const Color clrGrey200 = Color(0xFFF9F9F9);
  static const Color clrGrey300 = Color(0xFFF3F3F3);
  static const Color clrLightShadowGrey = Color(0xFFEAEAEA);
  static const Color clrTransparent = Color(0x00ffffff);
  static const Color clrDisable = Color(0xFFE9E9ED);
  static const Color clrUnselected = Color(0xFF95B8F6);
  static const Color clrSelected = Color(0xFFF3F7FF);
  static const Color clrBorder = Color(0xFFE8E9EC);
  static const Color clrError = Color(0xFFFA6969);
  static const Color clrBrightRed = Color(0xFFFF1744);
  static const Color clrPremiumLight = Color(0xFFFFE0A7);
  static const Color clrPremiumDark = Color(0xFFF0c280);

  /// Premium Page Colors
  static const Color clrNero = Color(0xFF2B2B2B);
  static const Color clrGhostWhite = Color(0xFFF3F5FF);
  static const Color clrArboretum = Color(0xFF42C682);
  static const Color clrDarkSlateGray = Color(0xFF303030);
  static const Color clrTurquoiseBlue = Color(0xFF08222D);
  static const Color clrDeepSlateBlue = Color(0xFF29303C);
  static const Color clrBluishGray = Color(0xff6D6F78);
  static const Color clrPaleCream = Color(0xffFDFCF6);
  static const Color clrLightGrayishOrange = Color(0xffFCFAF4);
  static const Color clrWhiteViolet = Color(0xff79798B);
  static const Color clrApproxBrightSun = Color(0xffFBDA94);
  static const Color clrBrightPink = Color(0xffF06562);
  static const Color clrCreamyOrange = Color(0xffEAAA74);
  static const Color clrLightGrey = Color(0xffD7D7D7);
  static const Color clrSpanishGray = Color(0xff989898);
  static const Color clrSilverGray = Color(0xffaaaaaa);
  static const Color clrApproxConcord = Color(0xff858482);
  static const Color clrApricotOrange = Color(0xffF1A674);
  static const Color clrMidnightBlue = Color(0xff24292F);
  static const Color clrGunmetalGray = Color(0xff696E75);
  static const Color clrDarkGray = Color(0xffADADAD);
  static const Color clrVividPink = Color(0xffFF006B);
  static const Color clrGray10 = Color(0xff1A1A1A);
  static const Color clrCombinePureWhite = Color(0xff3A3A3A);
}

class ThemeFonts {
  static const String pretendard = 'Pretendard';
}

class AppTheme {
  AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: ThemeColors.clrWhite,
        foregroundColor: ThemeColors.clrBlack,
        titleTextStyle: TextStyle(color: ThemeColors.clrBlack),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ThemeColors.clrTransparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ThemeColors.clrWhite,
        ),
      );

  static TextTheme textTheme(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    const defaultTextColor = ThemeColors.clrBlack;
    const poppins = ThemeFonts.pretendard;
    return TextTheme(
      // Default values
      // fontSize: 96.0,
      // fontWeight: FontWeight.w300
      displayLarge: currentTextTheme.displayLarge!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 60.0,
      // fontWeight: FontWeight.w300
      displayMedium: currentTextTheme.displayMedium!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 48.0,
      // fontWeight: FontWeight.w400
      displaySmall: currentTextTheme.displaySmall!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 34.0,
      // fontWeight: FontWeight.w400
      headlineMedium: currentTextTheme.headlineMedium!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 24.0,
      // fontWeight: FontWeight.w400
      headlineSmall: currentTextTheme.headlineSmall!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 20.0,
      // fontWeight: FontWeight.w500
      titleLarge: currentTextTheme.titleLarge!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      labelMedium: currentTextTheme.titleLarge!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 16.0,
      // fontWeight: FontWeight.w400
      bodyLarge: currentTextTheme.bodyLarge!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w400
      bodyMedium: currentTextTheme.bodyMedium!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 16.0,
      // fontWeight: FontWeight.w400
      titleMedium: currentTextTheme.titleMedium!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w500
      titleSmall: currentTextTheme.titleSmall!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w500
      labelLarge: currentTextTheme.labelLarge!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 12.0,
      // fontWeight: FontWeight.w400
      bodySmall: currentTextTheme.bodySmall!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),

      // Default values
      // fontSize: 10.0,
      // fontWeight: FontWeight.w400
      labelSmall: currentTextTheme.labelSmall!.copyWith(
        color: defaultTextColor,
        fontFamily: poppins,
      ),
    );
  }

  /// Theme data for Material and Elevated button
  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeColors.clrWhite,
          backgroundColor: ThemeColors.accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );

  /// Theme data for Text button
  static TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ThemeColors.accentColor),
      );

  /// Theme data for Floating Action Button
  static FloatingActionButtonThemeData floatingActionButtonThemeData(
    BuildContext context,
  ) =>
      Theme.of(context)
          .floatingActionButtonTheme
          .copyWith(backgroundColor: ThemeColors.accentColor);

  /// Theme data for Floating Action Button
  static OutlinedButtonThemeData outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ThemeColors.accentColor,
          side: const BorderSide(color: ThemeColors.accentColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
}

class AppThemeDark {
  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      backgroundColor: ThemeColors.clrBlack,
      foregroundColor: ThemeColors.clrWhite,
      titleTextStyle: TextStyle(color: ThemeColors.clrWhite),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ThemeColors.clrTransparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ThemeColors.clrBlack,
      ),
    );
  }

  static TextTheme textThemeDark(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;
    const defaultTextColor = ThemeColors.clrWhite;
    return TextTheme(
      // Default values
      // fontSize: 96.0,
      // fontWeight: FontWeight.w300
      displayLarge: currentTextTheme.displayLarge!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.displayLarge!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 60.0,
      // fontWeight: FontWeight.w300
      displayMedium: currentTextTheme.displayMedium!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.displayMedium!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 48.0,
      // fontWeight: FontWeight.w400
      displaySmall: currentTextTheme.displaySmall!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.displaySmall!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 34.0,
      // fontWeight: FontWeight.w400
      headlineMedium: currentTextTheme.headlineMedium!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.headlineMedium!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 24.0,
      // fontWeight: FontWeight.w400
      headlineSmall: currentTextTheme.headlineSmall!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.headlineSmall!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 20.0,
      // fontWeight: FontWeight.w500
      titleLarge: currentTextTheme.titleLarge!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.titleLarge!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 16.0,
      // fontWeight: FontWeight.w400
      bodyLarge: currentTextTheme.bodyLarge!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.bodyLarge!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w400
      bodyMedium: currentTextTheme.bodyMedium!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.bodyMedium!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 16.0,
      // fontWeight: FontWeight.w400
      titleMedium: currentTextTheme.titleMedium!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.titleMedium!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w500
      titleSmall: currentTextTheme.titleSmall!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.titleSmall!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 14.0,
      // fontWeight: FontWeight.w500
      labelLarge: currentTextTheme.labelLarge!.copyWith(
        fontSize: currentTextTheme.labelLarge!.fontSize! + 2.0,
        fontWeight: FontWeight.bold,
      ),

      // Default values
      // fontSize: 12.0,
      // fontWeight: FontWeight.w400
      bodySmall: currentTextTheme.bodySmall!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.bodySmall!.fontSize! + 2.0,
      ),

      // Default values
      // fontSize: 10.0,
      // fontWeight: FontWeight.w400
      labelSmall: currentTextTheme.labelSmall!.copyWith(
        color: defaultTextColor,
        fontSize: currentTextTheme.labelSmall!.fontSize! + 2.0,
      ),
    );
  }

  /// Default theme data for Material and Elevated button
  static ButtonThemeData buttonThemeData(BuildContext context) =>
      Theme.of(context).buttonTheme.copyWith(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            buttonColor: ThemeColors.accentColor,
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                const ColorScheme.light(primary: ThemeColors.accentColor),
            disabledColor: ThemeColors.clrGrey50,
          );

  /// Theme data for Material and Elevated button
  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeColors.clrWhite,
          backgroundColor: ThemeColors.accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );

  /// Theme data for Text button
  static TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ThemeColors.accentColor),
      );

  /// Theme data for Floating Action Button
  static FloatingActionButtonThemeData floatingActionButtonThemeData(
    BuildContext context,
  ) =>
      Theme.of(context)
          .floatingActionButtonTheme
          .copyWith(backgroundColor: ThemeColors.accentColor);

  /// Theme data for Floating Action Button
  static OutlinedButtonThemeData outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ThemeColors.accentColor,
          side: const BorderSide(color: ThemeColors.accentColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );

  /// Default style for label
  TextStyle labelStyle(BuildContext context) => textThemeDark(context)
      .labelSmall!
      .copyWith(fontSize: 14, color: ThemeColors.clrBlack50);
}

ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: ThemeColors.accentColor,
      primaryColorLight: ThemeColors.accentColor,
      primaryColorDark: ThemeColors.clrAccentBlack,
      scaffoldBackgroundColor: ThemeColors.clrWhite,
      appBarTheme: AppTheme().appBarTheme(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ThemeColors.accentColor,
        selectionColor: ThemeColors.accentColor.withOpacity(0.4),
        selectionHandleColor: ThemeColors.accentColor,
      ),
      useMaterial3: false,
      focusColor: ThemeColors.accentColor,
      textButtonTheme: AppTheme.textButtonThemeData(),
      elevatedButtonTheme: AppTheme.elevatedButtonThemeData(),
      outlinedButtonTheme: AppTheme.outlinedButtonThemeData(),
      floatingActionButtonTheme:
          AppTheme.floatingActionButtonThemeData(context),
      fontFamily: ThemeFonts.pretendard,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ThemeColors.accentColor,
        secondary: ThemeColors.accentColor,
        background: ThemeColors.clrWhite,
      ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      colorSchemeSeed: ThemeColors.accentColor,
      scaffoldBackgroundColor: ThemeColors.clrBlack100,
      brightness: Brightness.dark,
      useMaterial3: false,
      appBarTheme: AppThemeDark.appBarTheme(),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ThemeColors.accentColor,
        selectionColor: ThemeColors.accentColor,
        selectionHandleColor: ThemeColors.accentColor,
      ),
      focusColor: ThemeColors.accentColor,
      textButtonTheme: AppThemeDark.textButtonThemeData(),
      buttonTheme: AppThemeDark.buttonThemeData(context),
      elevatedButtonTheme: AppThemeDark.elevatedButtonThemeData(),
      outlinedButtonTheme: AppThemeDark.outlinedButtonThemeData(),
      floatingActionButtonTheme:
          AppThemeDark.floatingActionButtonThemeData(context),
      fontFamily: ThemeFonts.pretendard,
    );
