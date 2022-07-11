import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';

bool isApple() {
  return Get.theme.platform == TargetPlatform.macOS || Get.theme.platform == TargetPlatform.iOS;
}

String? getFileFormat({
  String? format,
  Uint8List? file,
}) {
  try {
    if (format == null) {
      return getFormatFromBytes(file);
    } else {
      return getFormatFromName(format);
    }
  } catch (e) {
    return null;
  }
}

String? getFormatFromBytes(Uint8List? file) {
  return lookupMimeType('', headerBytes: file)?.split('/')[1];
}

String getFormatFromName(String name) {
  const String dot = '.';
  if (name.contains(dot)) {
    return name.split(dot)[name.split(dot).length - 1];
  } else {
    return name;
  }
}

int generateId() {
  return int.parse((100 + math.Random().nextInt(10)).toString() +
      genForm(DateTime.now()) + (10000 + math.Random().nextInt(100)).toString());
}

String genForm(final DateTime dt) {
  return subString(replaceAllSymbols(dt.toString()));
}

String subString(final String str) {
  return str.substring(0, 9);
}

String replaceAllSymbols(String? string) {
  if (string == null) {
    return '';
  } else {
    return string
        .replaceAll('+', '')
        .replaceAll('!', '')
        .replaceAll(')', '')
        .replaceAll('[', '')
        .replaceAll('*', '')
        .replaceAll('"', '')
        .replaceAll('=', '')
        .replaceAll('-', '')
        .replaceAll('/', '')
        .replaceAll('\\', '')
        .replaceAll(']', '')
        .replaceAll('?', '')
        .replaceAll('(', '')
        .replaceAll('%', '')
        .replaceAll("'", '')
        .replaceAll(':', '')
        .replaceAll('{', '')
        .replaceAll(' ', '')
        .replaceAll('@', '')
        .replaceAll('\$', '')
        .replaceAll(';', '')
        .replaceAll('}', '')
        .replaceAll('<', '')
        .replaceAll('>', '')
        .replaceAll('|', '')
        .replaceAll('.', '')
        .replaceAll(',', '');
  }
}

Uri? getUri(String url) {
  return Uri.tryParse(url);
}

Future<void> delayedFunc({final int milliseconds = 1000}) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}
