// ================= Generic Image Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericImagePage extends StatelessWidget {
  GenericImagePage({required this.image, this.isResponsive = false, Key? key}) : super(key: key);
  String image;
  bool isResponsive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
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
          Positioned(
              bottom: Get.height * 0.1,
              left: Get.width / 3,
              child: Visibility(
                  visible: isResponsive,
                  child: TextButton(
                    child: Text(
                      'strSendReport'.tr,
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor),
                    ),
                    onPressed: () => {},
                  )))
        ],
      ),
    );
  }
}
