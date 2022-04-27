import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Neumorphic extends StatelessWidget {
  const Neumorphic({required this.width, required this.height, this.color = Colors.white, this.child, Key? key}) : super(key: key);
  final double width;
  final double height;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.white60, offset: Offset(-width * 0.02, -height * 0.02), blurRadius: width * 0.02)],
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(width * 0.02, height * 0.02), blurRadius: width * 0.02)]
        ),
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Center(child: child),
        ),
      ),
    );
  }
}
