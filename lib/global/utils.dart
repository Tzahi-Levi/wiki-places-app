// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import 'dart:math';
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

void displayCurrentPlaceDetails() {
  final StoreController _storeController = Get.put(StoreController());
  displayAlertDialog(
      content: Text('strCurrentPlaceDetails'.trParams({
        'radius': _storeController.radius.value,
        'scale': GlobalConstants.defaultScale,
        'place': _storeController.placeMode.value == EPlaceMode.current ? 'strCurrentPlace'.tr : _storeController.placeName.value,
      })));
}

void displaySnackbar({required String content, String title = "", TextButton? mainButton}) {
  Get.snackbar(
    title,
    content,
    mainButton: mainButton,
    titleText: Text(title, style: Get.textTheme.headline6),
    messageText: Text(content, style: Get.textTheme.headline6),
    snackPosition: SnackPosition.BOTTOM,
    barBlur: 50,
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
    padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
    reverseAnimationCurve: Curves.easeOut,
  );
}

void openModalBottomSheet({required Widget widget}) {  // TODO- need to be designed
  Get.bottomSheet(
    widget,
    // SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.only(bottom: 15.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: children,
    //       ),
    //     ),
    // ),
    // isScrollControlled: true,
    backgroundColor: Get.theme.primaryColorLight,
    // elevation: 10,
    // shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(15), topRight: Radius.circular(15)
    //     ),
    // ),
  );
}

void displayAlertDialog({String title = "", required Widget content}) {
  Get.defaultDialog(
      title: title,
      content: Column(
          children: [
            content,
            TextButton(
              child: Text('strClose'.tr),
              onPressed: navigateBack,
            ),
          ],
      ),
  );
}

void displayBanner({required String content}) async {
  if (Get.context == null) {
    return;
  }

  Get.dialog(
      await Flushbar(
        message: content,
        flushbarPosition: FlushbarPosition.TOP,
        leftBarIndicatorColor: Colors.green,
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        mainButton: TextButton(
          child: Text('strClose'.tr),
          onPressed: navigateBack,
        ),
        textDirection: Directionality.of(Get.context!),
        icon: const Icon(
          GlobalConstants.infoIcon,
          size: 28.0,
          color: Colors.green,
        ),
      ).show(Get.context!)
  );
}

// Converters
String fullAddressToDisplayedAddress(String address) {
  List addressToken = address.toString().split(",");
  addressToken.removeRange(min<int>(addressToken.length, GlobalConstants.defaultWordsInPlaceName), addressToken.length);
  return addressToken.join(",");
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
