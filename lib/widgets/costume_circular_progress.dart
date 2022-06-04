// ================= Circular Progress =================
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({this.size = 20, this.padding = 0, Key? key}) : super(key: key);
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(width: size, height: size, child: const CircularProgressIndicator()),
    );
  }
}
