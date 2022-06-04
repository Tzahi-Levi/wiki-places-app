// ================= Location Permission Page =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/pages/image_page/generic_image_page.dart';

class LocationPermissionPage extends StatelessWidget {
  const LocationPermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericImagePage(image: GlobalConstants.locationPermissionPageImage);
  }
}
