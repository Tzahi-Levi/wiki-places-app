// ================= Connection Lost =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/pages/image_page/generic_image_page.dart';

class ConnectionLostPage extends StatelessWidget {
  const ConnectionLostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericImagePage(image: GlobalConstants.connectionLostImage);
  }
}
