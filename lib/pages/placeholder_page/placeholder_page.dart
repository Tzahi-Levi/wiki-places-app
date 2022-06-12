// ================= Placeholder Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/widgets/app_background.dart';
import 'package:wiki_places/widgets/appbar.dart';
import 'package:wiki_places/widgets/search_places_fab.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({this.content = "", this.topWidgets = const [], this.firstIcon, this.secondIcon, this.appBar, Key? key}) : super(key: key);
  final String content;
  final List topWidgets;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final PreferredSizeWidget? appBar;

  List<String> get _textToken {
    if (firstIcon == null) {
      return [content];
    }

    List<String> textToken = [];
    List<String> firstTokens = content.split(GlobalConstants.firstIconTextSeparator);
    textToken.addAll([firstTokens[0], ...firstTokens[1].split(GlobalConstants.secondIconTextSeparator)]);
    return textToken;
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(Get.width, Get.height);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar != null ? appBar! : WikiPlacesAppBar(showAppTitle: true),
      body: Stack(
        children: [
          const AppBackground(),
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...topWidgets,
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.0001),
                child: Container(
                  width: size.width * 0.7,
                  height: size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.35),
                    gradient: RadialGradient(
                      tileMode: TileMode.mirror,
                      stops: const [0.4, 0.9],
                      colors: [
                        Get.theme.primaryColor,
                        Get.theme.primaryColorDark,
                      ],
                    ),
                    boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 5, offset: Offset(5, 5))]
                  ),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _textToken[0],
                          ),
                          WidgetSpan(
                            child: firstIcon == null ? Container() : Icon(firstIcon, color: Colors.white),
                          ),
                          TextSpan(
                            text: _textToken.length > 1 ? _textToken[1] : "",
                          ),
                          WidgetSpan(
                            child: secondIcon == null ? Container() : Icon(secondIcon, color: Colors.white),
                          ),
                          TextSpan(
                            text: _textToken.length > 2 ?_textToken[2] : "",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )],
      ),
      floatingActionButton: const SearchPlacesFAB(),
    );
  }
}
