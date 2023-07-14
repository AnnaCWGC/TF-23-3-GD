import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_style.dart';

Widget? isLoading({
  bool state = true,
  bool barrierDismissible = false,
}) {
  if (state) {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(
          color: AppStyleColor.colorPrimary,
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  } else {
    Get.back();
  }
}
