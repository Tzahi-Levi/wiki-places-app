import 'package:flutter/material.dart';
import 'package:wiki_places/global/constants.dart';

class ConnectionLostPage extends StatelessWidget {
  const ConnectionLostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            GlobalConstants.connectionLostImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 25,
                    color: Color(0xFF59618B).withOpacity(0.17),
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