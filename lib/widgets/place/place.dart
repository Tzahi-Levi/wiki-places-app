// ================= Place View =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:wiki_places/widgets/place/place_model.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/webview/webview.dart';

class Place extends StatelessWidget {
  const Place(this.model, {Key? key}) : super(key: key);
  final PlaceModel model;

  void _openWikipedia() {
    navigateToPage(WebViewPage(url: model.url));
    GoogleAnalytics.instance.logReadMoreClicked();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,  // TODO- change in design
      child: Column(
        children: [
          Text(model.label),
          Row(
            children: [
              // Image.network(model.url),
              Visibility(
                  visible: model.abstract != null,
                  child: Text(model.abstract!),
              ),
            ],
          ),
          TextButton(
              onPressed: _openWikipedia,
              child: Text('strReadMore'.tr),
          ),
          Container(
            color: Colors.white,  // TODO- change in design
            child: Text(model.distance.toPrecisionString()),
          )
        ],
      ),
    );
  }
}
