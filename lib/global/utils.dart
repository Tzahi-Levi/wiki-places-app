// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/pages/webview/webview.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/controllers/store_controller.dart';

// Navigation
void navigateToPage(Widget page) {
  Get.to(page);
}

void navigateWithNoBack(Widget page) {
  Get.off(page);
}

void navigateBack() {
  Get.back();
  if (Get.context != null) {
    FocusScope.of(Get.context!).unfocus(); // Remove the keyboard
  }
}

void openWikipedia(String url) {
  navigateToPage(WebViewPage(url: url));
  GoogleAnalytics.instance.logWikipediaOpened();
}

// Messages
void displaySearchSuccessfully() {
  final StoreController _storeController = Get.put(StoreController());
  displaySnackbar(
      content: 'strSearchSuccessfully'.trParams({
        'radius': _storeController.radius.value,
        'scale': GlobalConstants.defaultScale,
        'place': _storeController.placeMode.value == EPlaceMode.current ? 'strCurrentPlace'.tr : _storeController.placeName.value,
      }));
}

void displaySnackbar({String title = "", String content = ""}) {
  Get.snackbar(title, content,
      titleText: Text(title, style: Get.textTheme.headline6),
      messageText: Text(content, style: Get.textTheme.headline6),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 50, 
      snackStyle: SnackStyle.FLOATING, 
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40)
  );
}

void openModalBottomSheet({List<Widget>? children}) {  // TODO- not in use right now, can be removed
  if (children == null) {
    return;
  }

  Get.bottomSheet(
    SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
    ),
    isScrollControlled: true,
    backgroundColor: Get.theme.primaryColorLight,
    elevation: 10,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)
        ),
    ),
  );
}

void displayAlertDialog({String title = "", Widget? content}) {
  Get.defaultDialog(
      title: title,
      content: content == null ? null : Column(
          children: [
            content,
            TextButton(
              child: Text('strClose'.tr),
              onPressed: () {navigateBack();},
            ),
          ],
      ),
  );
}

// Converters
String fullAddressToDisplayedAddress(String address) {
  List addressToken = address.toString().split(",");
  addressToken.removeRange(GlobalConstants.defaultWordsInPlaceName, addressToken.length);
  return addressToken.join(",");
}

// Extensions
extension St on String {
  int compareStrings(String other) {
    return toLowerCase().compareTo(other.toLowerCase());
  }

  bool containsAll(List items) {
    for (var item in items) {
      if (!contains(item.toString())) {
        return false;
      }
    }
    return true;
  }
}

extension Ex on num {
  String toPrecisionString() => double.parse(toStringAsFixed(GlobalConstants.defaultPrecision)).toString();
}
