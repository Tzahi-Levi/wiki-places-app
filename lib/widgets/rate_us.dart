// ================= Rate Us Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key: key);

  void _onCancel() {
    GoogleAnalytics.instance.logRateUsCancel();
  }

  void _onSubmit(RatingDialogResponse response) {
    sendEmail(subject: "New Rate for WikiPo app has been recorded", text: "Rate: ${response.rating}\nComment: ${response.comment}");
    GoogleAnalytics.instance.logRateUsSubmit();
  }

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      initialRating: GlobalConstants.defaultInitialRating,
      title: Text(
        'strAppName'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        'strRateUsExplanation'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      image: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset(GlobalConstants.appIconImage),
      ),
      starSize: 30,
      submitButtonText: 'strSubmit'.tr,
      commentHint: 'strCommentHint'.tr,
      onCancelled: _onCancel,
      onSubmitted: _onSubmit,
    );
  }
}
