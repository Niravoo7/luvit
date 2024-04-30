import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/string_constants.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/core/local_db/get_storage_db.dart';
import 'package:luvit/core/local_languages/languages.dart';
import 'package:luvit/core/utils/no_scroll_glow.dart';
import 'package:luvit/routes/app_page.dart';
import 'package:luvit/routes/app_routes.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  late LocalCache localCache;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();

    localCache = Get.find<LocalCache>();
    isDarkMode = localCache.getBool(Preferences.isDarkMode);
  }

  Locale? getDeviceLocal() {
    Locale? locale;
    if (localCache.getInt(Preferences.language) != null) {
      locale = locales[localCache.getInt(Preferences.language)!]['locale'];
    } else {
      locale = const Locale('en', 'US');
      localCache.setInt(Preferences.language, 0);
      final localeVar = Get.deviceLocale;
      for (var i = 0; i < locales.length; i++) {
        if (locales[i]['locale'] == localeVar) {
          locale = locales[i]['locale'];
          localCache.setInt(Preferences.language, i);
          break;
        }
      }
    }
    return locale;
  }

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      child: GetMaterialApp(
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
        translations: Languages(),
        locale: getDeviceLocal(),
        fallbackLocale: const Locale('en', 'US'),
        getPages: AppPage.list,
        initialRoute: AppRoutes.splashRoute,
        scrollBehavior: NoGlowScrollBehavior(),
      ),
    );
  }
}
