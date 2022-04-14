// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';

// Navigation
void navigateToPage(Widget page, AppPages? pageEnum) {
  Get.to(page);
}

void navigateBack(context) {
  Get.back();
  FocusScope.of(context).unfocus(); // Remove the keyboard
}

// Converters
dynamic indexToEnum(List enumValues, int index) {
  try {
    return enumValues[index];
  } catch (e) {
    return null;
  }
}
