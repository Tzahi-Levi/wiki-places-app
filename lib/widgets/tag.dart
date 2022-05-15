import 'dart:math';

import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({required this.title, required this.onDeleted, Key? key})
      : super(key: key);

  final String title;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Chip(
        backgroundColor: Color(Random().nextInt(0xffffff00)),
        label: Text(title),
        elevation: 3,
        onDeleted: onDeleted,
      ),
    );
  }
}
