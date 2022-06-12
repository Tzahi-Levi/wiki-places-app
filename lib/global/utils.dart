// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:wiki_places/global/config.dart';
import 'dart:math';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/pages/webview/webview.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:mailer/mailer.dart' as mail;
import 'package:mailer/smtp_server.dart';

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
      title: 'strWhatISee'.tr,
      content: Text('strCurrentPlaceDetails'.trParams({
        'radius': _storeController.radius.value,
        'scale': GlobalConstants.defaultScale,
        'place': _storeController.placeMode.value == EPlaceMode.current ? 'strCurrentPlace'.tr : _storeController.placeName.value,
      }), style: Get.textTheme.headline6,));
}

void displaySnackbar({required String content, String title = "", TextButton? mainButton}) {
  Get.snackbar(
    title,
    content,
    backgroundColor: Get.theme.primaryColorLight,
    mainButton: mainButton,
    titleText: Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(child: Text(title, style: Get.textTheme.headline2)),
    ),
    messageText: Center(child: Text(content, style: Get.textTheme.headline6)),
    snackPosition: SnackPosition.BOTTOM,
    barBlur: 50,
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
    padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
    reverseAnimationCurve: Curves.easeOut,
  );
}

void openModalBottomSheet({required Widget widget}) {
  Get.bottomSheet(
    SingleChildScrollView(
      child: widget
    ),
    backgroundColor: Get.theme.canvasColor,
  );
}

void displayAlertDialog({String title = "", required Widget content}) {
  Get.defaultDialog(
    titlePadding: EdgeInsets.only(top: 25),
      titleStyle: Get.textTheme.headline2,
      title: title,
      content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: content,
            ),
            SizedBox(
              height: 35,
              child: TextButton(
                child: Text('strClose'.tr),
                onPressed: navigateBack,
              ),
            ),
          ],
      ),
  );
}

void displayBanner({required String content}) async {
  if (Get.context == null || isDialogOpen) {
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
        onStatusChanged: (newStatus) => {isDialogOpen = (newStatus != null && newStatus != FlushbarStatus.DISMISSED)},
      ).show(Get.context!)
  );
}

void sendEmail(List<String> recipients, String subject, String text) async {
  SmtpServer smtpServer = gmail(ProjectConfig.appEmail, ProjectConfig.appEmailPassword);
  final message = mail.Message()
    ..from = const mail.Address(ProjectConfig.appEmail, ProjectConfig.projectName)
    ..recipients.addAll(recipients)
    ..subject = subject
    ..text = text;
  await mail.send(message, smtpServer);
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

dynamic indexToEnum(List values, int index) {
  try {
    return values[index];
  } catch (e) {
    return null;
  }
}
