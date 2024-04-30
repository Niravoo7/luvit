import 'dart:ui';

import 'package:get/get.dart';
import 'package:luvit/core/constants/image_constants.dart';
import 'package:luvit/core/local_languages/supported_languages/english.dart';
import 'package:luvit/core/local_languages/supported_languages/portuguese.dart';
import 'package:luvit/core/local_languages/supported_languages/spanish.dart';
import 'package:luvit/core/local_languages/supported_languages/thai.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': English.english,
        'pt_BR': Portuguese.portuguese,
        'es_ES': Spanish.spanish,
        'th_TH': Thai.thai,
      };
}

final List locales = [
  {
    'name': 'ENGLISH',
    'locale': const Locale('en', 'US'),
    'flagImage': FlagConstants.fgEnglish,
  },
  {
    'name': 'PORTUGUESE',
    'locale': const Locale('pt', 'BR'),
    'flagImage': FlagConstants.fgPortuguese,
  },
  {
    'name': 'SPANISH',
    'locale': const Locale('es', 'ES'),
    'flagImage': FlagConstants.fgSpanish,
  },
  {
    'name': 'THAI',
    'locale': const Locale('th', 'TH'),
    'flagImage': FlagConstants.fgThai,
  },
];
