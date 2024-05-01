import 'dart:ui';

import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/local_languages/supported_languages/english.dart';
import 'package:luvit/core/local_languages/supported_languages/korean.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': English.english,
        'ko_KR': Korean.korean,
      };
}

final List locales = [
  {
    'name': 'ENGLISH',
    'locale': const Locale('en', 'US'),
    'flagImage': FlagConstants.fgEnglish,
  },
  {
    'name': 'KOREAN',
    'locale': const Locale('ko', 'KR'),
    'flagImage': FlagConstants.fgKorean,
  },
];
