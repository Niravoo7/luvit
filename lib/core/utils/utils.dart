import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/theme_constants.dart';
import 'package:luvit/core/library/basic_utils/basic_utils.dart';

/// Showing the toast with custom fields
Future<void> showToast({
  required String title,
  String? subTitle,
  SnackPosition? position,
  Duration? duration,
}) async {
  if (Get.isSnackbarOpen) {
    await Get.closeCurrentSnackbar();
  }
  Get.snackbar(
    title,
    subTitle ?? '',
    messageText:
        StringUtils.isNullOrEmpty(subTitle) ? const SizedBox.shrink() : null,
    colorText: ThemeColors.clrWhite,
    backgroundColor: ThemeColors.accentColor,
    snackPosition: position ?? SnackPosition.BOTTOM,
    duration: duration ?? 1.seconds,
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(20),
  );
}

Future<bool> checkInternetConnect() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}


bool isBase64(String input) {
  final RegExp base64Regex =
  RegExp(r'^data:image\/[a-zA-Z]*;base64,([A-Za-z0-9+/=]*)$');
  return base64Regex.hasMatch(input);
}


void internetDialogue({
  required String strMessage,
  required Function onCallback,
  BuildContext? context,
}) {
  showDialog(
    context: (context != null) ? context : Get.context!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 230,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CupertinoActivityIndicator(radius: 30),
              Text(
                strMessage,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.clrWhite,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  onCallback();
                },
                child: Text('strTryAgain'.tr),
              ),
            ],
          ),
        ),
      );
    },
  );
}
