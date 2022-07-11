import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/shared/core/localization/keys.dart';
import 'package:todo_app/shared/utils/utils.dart';

class Month {
  static const int january = 1;
  static const int february = 2;
  static const int march = 3;
  static const int april = 4;
  static const int may = 5;
  static const int june = 6;
  static const int july = 7;
  static const int august = 8;
  static const int september = 9;
  static const int october = 10;
  static const int november = 11;
  static const int december = 12;
}

void getDate(Rx<DateTime> date) {
  isApple() ? _selectDateIos(date) : _selectDateAndroid(date);
}

void _selectDateIos(Rx<DateTime> date) {
  showCupertinoModalPopup<DateTime>(
    context: Get.context!,
    builder: (_) {
      return SizedBox(
        width: Get.width,
        height: 260,
        child: CupertinoDatePicker(
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime value) {
            date(value);
          },
          initialDateTime: date.value,
          minimumYear: 1900,
          maximumYear: 2100,
        ),
      );
    },
  );
}

void _selectDateAndroid(Rx<DateTime> date) async {
  final DateTime? picked = await showDatePicker(
    context: Get.context!,
    initialDate: date.value,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (picked != null && picked != date.value) {
    date(picked);
  }
}

DateTime? dateFromMilliseconds(final int? timestamp) {
  if (timestamp != null) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  } else {
    return null;
  }
}

int? getMillisecondsSinceEpochDateTime(final DateTime date) {
  try {
    return date.millisecondsSinceEpoch;
  } catch (e) {
    return null;
  }
}

bool isTheSameDay({
  required final int? firstDate,
  required final int? secondDate,
}) {
  if (firstDate != null && secondDate != null) {
    final DateTime firstDateTime = dateFromMilliseconds(firstDate)!;
    final DateTime secondDateTime = dateFromMilliseconds(secondDate)!;
    return firstDateTime.year == secondDateTime.year &&
        firstDateTime.month == secondDateTime.month &&
        firstDateTime.day == secondDateTime.day;
  } else {
    return false;
  }
}

String getDateYT(final int? date) {
  if (date != null) {
    final DateTime dateTime = dateFromMilliseconds(date)!;
    final DateTime now = DateTime.now();
    final DateTime yesterday = now.subtract(const Duration(days: 1));
    if (isTheSameDay(
      firstDate: getMillisecondsSinceEpochDateTime(now),
      secondDate: date,
    )) {
      return StringsKeys.today.tr;
    } else if (dateTime.difference(yesterday).inDays == 1) {
      return StringsKeys.tomorrow.tr;
    } else if (dateTime.difference(yesterday).inDays == 0) {
      return StringsKeys.yesterday.tr;
    } else {
      return getDateFormat(date);
    }
  } else {
    return '';
  }
}

String getDateTimeFormat(final DateTime? date) {
  String res = '';
  if (date != null) {
    return '${dateCheckZero(date.day)} ${getMonth(date)} ${date.year}';
  }
  return res;
}

String getDateFormat(final int? timestamp) {
  String res = '';
  if (timestamp != null) {
    final DateTime date = dateFromMilliseconds(timestamp)!;
    return '${dateCheckZero(date.day)} ${getMonth(date)} ${date.year}';
  }
  return res;
}

String getMonth(final DateTime date, {final bool fullName = true}) {
  switch (date.month) {
    case Month.january:
      return fullName ? StringsKeys.january.tr : StringsKeys.jan.tr;
    case Month.february:
      return fullName ? StringsKeys.february.tr : StringsKeys.feb.tr;
    case Month.march:
      return fullName ? StringsKeys.march.tr : StringsKeys.mar.tr;
    case Month.april:
      return fullName ? StringsKeys.april.tr : StringsKeys.apr.tr;
    case Month.may:
      return fullName ? StringsKeys.mayFull.tr : StringsKeys.may.tr;
    case Month.june:
      return fullName ? StringsKeys.june.tr : StringsKeys.jun.tr;
    case Month.july:
      return fullName ? StringsKeys.july.tr : StringsKeys.jul.tr;
    case Month.august:
      return fullName ? StringsKeys.august.tr : StringsKeys.aug.tr;
    case Month.september:
      return fullName ? StringsKeys.september.tr : StringsKeys.sept.tr;
    case Month.october:
      return fullName ? StringsKeys.october.tr : StringsKeys.oct.tr;
    case Month.november:
      return fullName ? StringsKeys.november.tr : StringsKeys.nov.tr;
    case Month.december:
      return fullName ? StringsKeys.december.tr : StringsKeys.dec.tr;
    default:
      return '';
  }
}

String dateCheckZero(final int v) {
  final String e = v.toString();
  if (e.length == 1) {
    return '0$e';
  } else {
    return e;
  }
}
