// ================= Bottom Navigation Widget =================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/store_controller.dart';
import 'package:wiki_places/global/types.dart';
import 'package:wiki_places/global/utils.dart';
import 'package:wiki_places/pages/home/home.dart';
import 'package:wiki_places/pages/map/map.dart';
import 'package:wiki_places/pages/places/places.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) =>
          CustomBottomNavigationBar(), /*BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_storeController.currentMainAppPage.value == AppPages.places ? GlobalConstants.placesPageSelectedIcon : GlobalConstants.placesPageOutLinedIcon),
            label: 'strPlacesPageName'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(_storeController.currentMainAppPage.value == AppPages.map ? GlobalConstants.mapPageSelectedIcon : GlobalConstants.mapPageOutLinedIcon),
            label: 'strMapPageName'.tr,
          ),
        ],
        currentIndex: _storeController.currentMainAppPage.value.index,
        onTap: _storeController.changeMainAppPage,
      )*/
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _storeController = Get.put(StoreController());
    return Container(
      width: size.width,
      height: 90,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              child: CustomPaint(
                size: Size(size.width, 90),
                painter: WPCustomPainter(),
              )),
          Container(
            width: size.width,
            height: 90,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  width: size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _storeController.currentMainAppPage.value = AppPages.places;
                          },
                          icon: Icon(
                            _storeController.currentMainAppPage.value ==
                                    AppPages.places
                                ? GlobalConstants.placesPageSelectedIcon
                                : GlobalConstants.placesPageOutLinedIcon,
                            size: 35,
                          ),
                          padding: EdgeInsets.zero,
                          constraints:
                              BoxConstraints(minWidth: 30, minHeight: 30),
                          splashRadius: 25,
                        ),
                        Text('strPlacesPageName'.tr)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _storeController.currentMainAppPage.value = AppPages.map;
                          },
                          icon: Icon(
                              _storeController.currentMainAppPage.value ==
                                      AppPages.map
                                  ? GlobalConstants.mapPageSelectedIcon
                                  : GlobalConstants.mapPageOutLinedIcon,
                              size: 35),
                          padding: EdgeInsets.zero,
                          constraints:
                              BoxConstraints(minWidth: 30, minHeight: 30),
                          splashRadius: 25,
                        ),
                        Text('strMapPageName'.tr)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WPCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 40);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, 40);
    path.lineTo(size.width, 90);
    path.lineTo(0, 90);
    canvas.drawShadow(path.shift(Offset(0, -10)), Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}