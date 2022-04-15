// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';

// Navigation
void navigateToPage(Widget page) {
  Get.to(page);
}

void navigateBack() {
  Get.back();
  if (Get.context != null) {
    FocusScope.of(Get.context!).unfocus(); // Remove the keyboard
  }
}

// Messages
void displaySnackbar({String title = "", String content = ""}) {
  Get.snackbar(title, content, snackPosition: SnackPosition.BOTTOM);
}

void openModalBottomSheet({List<Widget>? children}) {
  if (children == null) {
    return;
  }

  Get.bottomSheet(
      SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.only(
            //   bottom: Get.context!.mediaQueryViewInsets.bottom,
            // ),
            child: SafeArea(
              child: Wrap(
                children: children,
              ),
            ),
          ),
      ),
    isScrollControlled: true,
  );
}

// Converters
dynamic indexToEnum(List enumValues, int index) {
  try {
    return enumValues[index];
  } catch (e) {
    return null;
  }
}

// Extensions
extension St on String {
  int compareStrings(String other) {
    return toLowerCase().compareTo(other.toLowerCase());
  }
}

extension Ex on num {
  String toPrecisionString() => double.parse(toStringAsFixed(GlobalConstants.defaultPrecision)).toString();
}
