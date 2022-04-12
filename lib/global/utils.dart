// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

// Navigation
void navigateToPage(Widget page, AppPages? pageEnum) {
  Get.to(page);
  GoogleAnalytics.instance.logPageOpened(pageEnum);
}

void navigateBack(context) {
  Get.back();
  FocusScope.of(context).unfocus(); // Remove the keyboard
}

// Format
extension En on Enum {
  String toCleanString() => toString().split(".")[1];
}
