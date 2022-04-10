// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';
// import 'package:wiki_places/firebase_wrapper/google_analytics_repository.dart';

// Navigation
void navigateToPage(Widget page, AppPages? pageEnum) {
  Get.to(page);
  // GoogleAnalytics.instance.logPageOpened(pageEnum);  // TODO
}

void navigateBack(context) {
  Get.back();
  FocusScope.of(context).unfocus(); // Remove the keyboard
}
