// ================= Generic Image Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/global/utils.dart';

class GenericImagePage extends StatefulWidget {
  GenericImagePage({required this.image, this.reportError = false, Key? key}) : super(key: key);
  final String image;
  final bool reportError;

  @override
  State<GenericImagePage> createState() => _GenericImagePageState();
}

class _GenericImagePageState extends State<GenericImagePage> {
  bool _disabledReportError = false;

  void _reportError() {
    sendEmail(subject: "WikiPo Error", text: "A user reports that he can't open the app- maybe the server is down");
    displaySnackbar(content: "strReportRecorded".tr);
    setState(() {
      _disabledReportError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 25,
                    color: const Color(0xFF59618B).withOpacity(0.17),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.reportError,
            child: Positioned(
              bottom: Get.height * 0.1,
              left: Get.width / 3,
              child: TextButton(
                    child: Text(
                      'strSendReport'.tr,
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _disabledReportError ? Get.theme.disabledColor : Get.theme.primaryColor,
                      ),
                    ),
                    onPressed: _disabledReportError ? null : _reportError,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
