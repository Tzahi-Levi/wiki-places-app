// ================= Error Page =================
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/pages/image_page/generic_image_page.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericImagePage(image: GlobalConstants.errorPageImage);
  }
}
