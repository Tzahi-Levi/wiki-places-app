// ================= Generic Image Page =================
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class GenericImagePage extends StatelessWidget {
  GenericImagePage({this.image = "", Key? key}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
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
        ],
      ),
    );
  }
}
