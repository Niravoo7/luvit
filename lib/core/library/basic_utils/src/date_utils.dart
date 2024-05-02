import 'package:get/utils.dart';

///
/// Helper class for date operations.
///
class DateUtils {
  static const daysOfWeek = 7;
  static const regexMonday = 'mon|Mon|monday|Monday';
  static const regexTuesday = 'tue|Tue|tuesday|Tuesday';
  static const regexWednesday = 'wed|Wed|wednesday|Wednesday';
  static const regexThursday = 'thu|Thu|thursday|Thursday';
  static const regexFriday = 'fri|Fri|friday|Friday';
  static const regexSaturday = 'sat|Sat|saturday|Saturday';
  static const regexSunday = 'sun|Sun|sunday|Sunday';
  static const regexJanuary = 'jan|Jan|january|January';
  static const regexFebruary = 'feb|Feb|february|February';
  static const regexMarch = 'mar|Mar|march|March';
  static const regexApril = 'apr|Apr|april|April';
  static const regexMay = 'may|May';
  static const regexJune = 'june|June';
  static const regexJuly = 'july|July';
  static const regexAugust = 'aug|Aug|august|August';
  static const regexSeptember = 'sep|Sep|september|September';
  static const regexOctober = 'oct|Oct|october|October';
  static const regexNovember = 'nov|Nov|november|November';
  static const regexDecember = 'dec|Dec|december|December';

  //ignore:non_constant_identifier_names
  static final REGEX_YEAR = RegExp(r'^(y|year|years)$');

  //ignore:non_constant_identifier_names
  static final REGEX_MONTH = RegExp(r'^(mo|month|months)$');

  //ignore:non_constant_identifier_names
  static final REGEX_WEEK = RegExp(r'^(w|week|weeks)$');

  //ignore:non_constant_identifier_names
  static final REGEX_DAY = RegExp(r'^(d|day|days)$');

  //ignore:non_constant_identifier_names
  static final REGEX_HOUR = RegExp(r'^(h|hour|hours)$');

  //ignore:non_constant_identifier_names
  static final REGEX_MINUTES = RegExp(r'^(m|minute|minutes)$');

  //ignore:non_constant_identifier_names
  static final REGEX_SECONDS = RegExp(r'^(s|second|seconds)$');

  //ignore:non_constant_identifier_names
  static final REGEX_MONDAY = RegExp('^($regexMonday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_TUESDAY = RegExp('^($regexTuesday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_WEDNESDAY = RegExp('^($regexWednesday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_THURSDAY = RegExp('^($regexThursday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_FRIDAY = RegExp('^($regexFriday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_SATURDAY = RegExp('^($regexSaturday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_SUNDAY = RegExp('^($regexSunday)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_JANUARY = RegExp('^($regexJanuary)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_FEBRUARY = RegExp('^($regexFebruary)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_MARCH = RegExp('^($regexMarch)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_APRIL = RegExp('^($regexApril)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_MAY = RegExp('^($regexMay)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_JUNE = RegExp('^($regexJune)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_JULY = RegExp('^($regexJuly)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_AUGUST = RegExp('^($regexAugust)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_SEPTEMBER = RegExp('^($regexSeptember)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_OCTOBER = RegExp('^($regexOctober)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_NOVEMBER = RegExp('^($regexNovember)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_DECEMBER = RegExp('^($regexDecember)\$');

  //ignore:non_constant_identifier_names
  static final REGEX_AM_PM = RegExp(
    r'^(\d{1,2}\s(pm|am)|\d{1,2}([.:])\d{2}\s(pm|am)|\d{1,2}([.:])\d{2}([.:])\d{2}\s(pm|am))$',
  );

  //ignore:non_constant_identifier_names
  static final REGEX_WEEKDAY = RegExp(
    '^($regexMonday|$regexTuesday|$regexWednesday|$regexThursday|$regexFriday|$regexSaturday|$regexSunday)\$',
  );

  //ignore:non_constant_identifier_names
  static final REGEX_MONTHS = RegExp(
    '^($regexJanuary|$regexFebruary|$regexMarch|$regexApril|$regexMay|$regexJune|$regexJuly|$regexSeptember|$regexOctober||$regexNovember||$regexDecember)\$',
  );

  //ignore:non_constant_identifier_names
  static final REGEX_DATE = RegExp(
    '^\\d{1,2}\\s($regexJanuary|$regexFebruary|$regexMarch|$regexApril|$regexMay|$regexJune|$regexJuly|$regexAugust|$regexSeptember|$regexOctober||$regexNovember||$regexDecember)\\s\\d{2,4}.*\$',
  );

  ///
  /// Converts English textual datetime description to a [DateTime] object.
  ///
  /// If [time] is set, it will be used to determine the desired date.
  /// If [time] is null (the default), now is used to determine the date.
  ///
  /// Example :
  /// ```dart
  /// stringToDateTime('yesterday'); // will receive yesterday from now
  /// stringToDateTime('yesterday', time: time); // will receive yesterday from the given date.
  /// ```
  ///
  /// Supported strings:
  /// * now
  /// * \+ 1 year(s)|y 2 month(s)|mo 3 week(s)|w 4 hour(s)|h 5 minute(s)|m 6 second(s)|s
  /// * \- 1 year(s)|y 2 month(s)|mo 3 week(s)|w 4 hour(s)|h 5 minute(s)|m 6 second(s)|s
  /// * yesterday (at 1 pm|1 hour|13:00:00)
  /// * tomorrow (at 1 pm|1 hour|13:00:00)
  /// * last monday (at 1 pm|1 hour|13:00:00)
  /// * next monday (at 1 pm|1 hour|13:00:00)
  /// * 10 September 2019 (at 1 pm|1 hour|13:00:00)
  /// * 1 day(s)|week(s)|month(s) ago
  /// * 2 pm next monday|week
  ///
  static DateTime stringToDateTime(String s, {DateTime? time}) {
    var now = DateTime.now();
    if (s == 'now') {
      return now;
    }
    now = time ?? now;
    if (s.startsWith('+')) {
      return _parseAddRem(s, now);
    } else if (s.startsWith('-')) {
      return _parseAddRem(s, now, rem: true);
    } else if (s.startsWith('next')) {
      return _parseNextLast(s, now);
    } else if (s.contains('next')) {
      final splitted = s.split('next');
      //ignore:parameter_assignments
      s = 'next ${splitted.elementAt(1)} at ${splitted.elementAt(0)}';
      return _parseNextLast(s, now);
    } else if (s.startsWith('last')) {
      return _parseNextLast(s, now, last: true);
    } else if (s.contains('last')) {
      final splitted = s.split('last');
      //ignore:parameter_assignments
      s = 'last ${splitted.elementAt(1)} at ${splitted.elementAt(0)}';
      return _parseNextLast(s, now, last: true);
    } else if (s.startsWith('yesterday')) {
      return _parseYesterdayTomorrow(s, now);
    } else if (s.startsWith('tomorrow')) {
      return _parseYesterdayTomorrow(s, now, tomorrow: true);
    } else if (s.contains('ago')) {
      return _parseAgo(s, now);
    } else {
      if (REGEX_DATE.hasMatch(s)) {
        return _parseDate(s);
      }
    }
    return DateTime.now();
  }

  static DateTime _parseDate(String s) {
    String date;
    String? setTime;
    if (s.contains('at')) {
      final list = s.split('at');
      date = list.elementAt(0).trim();
      setTime = list.elementAt(1).trim();
    } else {
      date = s.trim();
    }
    final dateSplitted = date.split(' ');
    final month = dateSplitted.elementAt(1);
    var monthAsInt = '';
    if (REGEX_JANUARY.hasMatch(month)) {
      monthAsInt = '0${DateTime.january}';
    } else if (REGEX_FEBRUARY.hasMatch(month)) {
      monthAsInt = '0${DateTime.february}';
    } else if (REGEX_MARCH.hasMatch(month)) {
      monthAsInt = '0${DateTime.march}';
    } else if (REGEX_APRIL.hasMatch(month)) {
      monthAsInt = '0${DateTime.april}';
    } else if (REGEX_MAY.hasMatch(month)) {
      monthAsInt = '0${DateTime.may}';
    } else if (REGEX_JUNE.hasMatch(month)) {
      monthAsInt = '0${DateTime.june}';
    } else if (REGEX_JULY.hasMatch(month)) {
      monthAsInt = '0${DateTime.july}';
    } else if (REGEX_AUGUST.hasMatch(month)) {
      monthAsInt = '0${DateTime.august}';
    } else if (REGEX_SEPTEMBER.hasMatch(month)) {
      monthAsInt = '0${DateTime.september}';
    } else if (REGEX_OCTOBER.hasMatch(month)) {
      monthAsInt = DateTime.october.toString();
    } else if (REGEX_NOVEMBER.hasMatch(month)) {
      monthAsInt = DateTime.november.toString();
    } else if (REGEX_DECEMBER.hasMatch(month)) {
      monthAsInt = DateTime.december.toString();
    }
    var time = DateTime.parse(
      '${dateSplitted.elementAt(2)}-$monthAsInt-${dateSplitted.elementAt(0)} 00:00:00',
    );
    if (setTime != null) {
      time = _parseSetTime(setTime, time);
    }
    return time;
  }

  static DateTime _parseAgo(String s, DateTime now) {
    //ignore:parameter_assignments
    s = s.substring(0, s.length - 3).trim();
    return _parseAddRem(s, now, rem: true);
  }

  static DateTime _parseYesterdayTomorrow(
    String s,
    DateTime now, {
    bool tomorrow = false,
  }) {
    DateTime time;
    if (tomorrow) {
      time = now.add(1.days);
    } else {
      time = now.subtract(1.days);
    }
    if (s.contains('at')) {
      final list = s.split('at');
      final setTime = list.elementAt(1).trim();
      time = _parseSetTime(setTime, time);
    }
    return time;
  }

  static DateTime _parseAddRem(String s, DateTime now, {bool rem = false}) {
    // Remove the + or -
    if (s.startsWith('+') || s.startsWith('-')) {
      //ignore:parameter_assignments
      s = s.substring(1);
    }

    String addRem;
    String? setTime;
    if (s.contains('at')) {
      final list = s.split('at');
      addRem = list.elementAt(0).trim();
      setTime = list.elementAt(1).trim();
    } else {
      addRem = s.trim();
    }
    // Split the string
    final list = addRem.split(' ');
    for (var i = 1; i < list.length; i += 2) {
      final value = list.elementAt(i - 1);
      var valueAsInt = int.parse(value);
      if (rem) {
        valueAsInt = valueAsInt * -1;
      }
      final type = list.elementAt(i);
      if (REGEX_YEAR.hasMatch(type)) {
        //print('Add $valueAsInt year(s)');
        //ignore:parameter_assignments
        now = DateTime(
          now.year + valueAsInt,
          now.month,
          now.day,
          now.hour,
          now.minute,
          now.second,
        );
      } else if (REGEX_MONTH.hasMatch(type)) {
        //print('Add $valueAsInt month(s)');
        //ignore:parameter_assignments
        now = DateTime(
          now.year,
          now.month + valueAsInt,
          now.day,
          now.hour,
          now.minute,
          now.second,
        );
      } else if (REGEX_WEEK.hasMatch(type)) {
        // print('Add / Rem $valueAsInt week(s)');
        //ignore:parameter_assignments
        now = now.add(Duration(days: 7 * valueAsInt));
      } else if (REGEX_DAY.hasMatch(type)) {
        //print('Add $valueAsInt day(s)');
        //ignore:parameter_assignments
        now = now.add(Duration(days: valueAsInt));
      } else if (REGEX_HOUR.hasMatch(type)) {
        //print('Add $valueAsInt hour(s)');
        //ignore:parameter_assignments
        now = now.add(Duration(hours: valueAsInt));
      } else if (REGEX_MINUTES.hasMatch(type)) {
        //print('Add $valueAsInt minute(s)');
        //ignore:parameter_assignments
        now = now.add(Duration(minutes: valueAsInt));
      } else if (REGEX_SECONDS.hasMatch(type)) {
        //print('Add $valueAsInt second(s)');
        //ignore:parameter_assignments
        now = now.add(Duration(seconds: valueAsInt));
      }
    }
    if (setTime != null) {
      if (setTime.contains(':')) {
        final hhmmss = DateTime.parse('1965-01-01 $setTime');
        //ignore:parameter_assignments
        now = DateTime(
          now.year,
          now.month,
          now.day,
          hhmmss.hour,
          hhmmss.minute,
          hhmmss.second,
        );
      } else {
        final list = setTime.split(' ');
        for (var i = 1; i < list.length; i += 2) {
          final value = list.elementAt(i - 1);
          var valueAsInt = int.parse(value);
          if (rem) {
            valueAsInt = valueAsInt * -1;
          }
          final type = list.elementAt(i);
          if (REGEX_HOUR.hasMatch(type)) {
            //ignore:parameter_assignments
            now = DateTime(
              now.year,
              now.month,
              now.day,
              valueAsInt,
              now.minute,
              now.second,
            );
          } else if (REGEX_MINUTES.hasMatch(type)) {
            //ignore:parameter_assignments
            now = DateTime(
              now.year,
              now.month,
              now.day,
              now.hour,
              valueAsInt,
              now.second,
            );
          } else if (REGEX_SECONDS.hasMatch(type)) {
            //ignore:parameter_assignments
            now = DateTime(
              now.year,
              now.month,
              now.day,
              now.hour,
              now.minute,
              valueAsInt,
            );
          }
        }
      }
    }
    return now;
  }

  static DateTime _parseNextLast(String s, DateTime now, {bool last = false}) {
    if (s.startsWith('next') || s.startsWith('last')) {
      //ignore:parameter_assignments
      s = s.substring(4);
    }
    String lastNext;
    String? setTime;
    if (s.contains('at')) {
      final list = s.split('at');
      lastNext = list.elementAt(0).trim();
      setTime = list.elementAt(1).trim();
    } else {
      lastNext = s.trim();
    }
    if (REGEX_WEEKDAY.hasMatch(lastNext)) {
      final currentDay = now.weekday;
      int daysToAdd;
      late int targetDay;
      if (REGEX_SUNDAY.hasMatch(lastNext)) {
        targetDay = DateTime.sunday;
      } else if (REGEX_SATURDAY.hasMatch(lastNext)) {
        targetDay = DateTime.saturday;
      } else if (REGEX_FRIDAY.hasMatch(lastNext)) {
        targetDay = DateTime.friday;
      } else if (REGEX_THURSDAY.hasMatch(lastNext)) {
        targetDay = DateTime.thursday;
      } else if (REGEX_WEDNESDAY.hasMatch(lastNext)) {
        targetDay = DateTime.wednesday;
      } else if (REGEX_TUESDAY.hasMatch(lastNext)) {
        targetDay = DateTime.tuesday;
      } else if (REGEX_MONDAY.hasMatch(lastNext)) {
        targetDay = DateTime.monday;
      }

      if (last) {
        if (currentDay < targetDay) {
          daysToAdd = daysOfWeek - targetDay + currentDay;
        } else {
          daysToAdd = targetDay - (daysOfWeek - currentDay);
        }
        //ignore:parameter_assignments
        now = now.add(Duration(days: daysToAdd * -1));
      } else {
        daysToAdd = targetDay - currentDay;
        //ignore:parameter_assignments
        now = now.add(Duration(days: daysToAdd));
      }
      if (setTime != null) {
        //ignore:parameter_assignments
        now = _parseSetTime(setTime, now);
      }
      return now;
    }
    if (REGEX_WEEK.hasMatch(lastNext)) {
      if (last) {
        //ignore:parameter_assignments
        now = now.add(const Duration(days: 7 * -1));
      } else {
        //ignore:parameter_assignments
        now = now.add(const Duration(days: 7));
      }
      if (setTime != null) {
        //ignore:parameter_assignments
        now = _parseSetTime(setTime, now);
      }
      return now;
    }
    return DateTime.now();
  }

  static DateTime _parseSetTime(String setTime, DateTime time) {
    if (setTime.contains(':')) {
      final hhmmss = DateTime.parse('1965-01-01 $setTime');
      return DateTime(
        time.year,
        time.month,
        time.day,
        hhmmss.hour,
        hhmmss.minute,
        hhmmss.second,
      );
    } else if (REGEX_AM_PM.hasMatch(setTime)) {
      var baseTime = 0;
      if (setTime.endsWith('pm') || setTime.endsWith('PM')) {
        baseTime = 12;
      }
      //ignore:parameter_assignments
      setTime = setTime.substring(0, setTime.length - 2).trim();
      //ignore:parameter_assignments
      setTime = setTime.replaceAll('.', ':');
      if (setTime.length == 1) {
        //ignore:parameter_assignments
        setTime = '0$setTime:00:00';
      } else if (setTime.length == 3) {
        //ignore:parameter_assignments
        setTime = '0$setTime:00';
      } else if (setTime.length == 4) {
        //ignore:parameter_assignments
        setTime = '$setTime:00:00';
      } else if (setTime.length == 5) {
        //ignore:parameter_assignments
        setTime = '0$setTime';
      }
      final hhmmss = DateTime.parse('1965-01-01 $setTime');
      return DateTime(
        time.year,
        time.month,
        time.day,
        hhmmss.hour + baseTime,
        hhmmss.minute,
        hhmmss.second,
      );
    } else {
      final list = setTime.split(' ');
      for (var i = 1; i < list.length; i += 2) {
        final value = list.elementAt(i - 1);
        final valueAsInt = int.parse(value);
        final type = list.elementAt(i);
        if (REGEX_HOUR.hasMatch(type)) {
          //ignore:parameter_assignments
          time = DateTime(
            time.year,
            time.month,
            time.day,
            valueAsInt,
            time.minute,
            time.second,
          );
        } else if (REGEX_MINUTES.hasMatch(type)) {
          //ignore:parameter_assignments
          time = DateTime(
            time.year,
            time.month,
            time.day,
            time.hour,
            valueAsInt,
            time.second,
          );
        } else if (REGEX_SECONDS.hasMatch(type)) {
          //ignore:parameter_assignments
          time = DateTime(
            time.year,
            time.month,
            time.day,
            time.hour,
            time.minute,
            valueAsInt,
          );
        }
      }
      return time;
    }
  }

  ///
  /// Calculates the calendar week for the given [date].
  ///
  static int getCalendarWeek(DateTime date) {
    //var dayOfYear = int.parse(DateFormat('D').format(date));
    final diff = date.difference(DateTime(date.year));
    final diffInDays = diff.inDays;

    return ((diffInDays - date.weekday + 10) / 7).floor();
  }
}
