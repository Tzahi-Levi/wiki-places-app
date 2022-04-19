// ================= Bottom Navigation Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomBottomNavigationBar();
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Size(Get.width, Get.height);
    final _storeController = Get.put(StoreController());
    return GetX<StoreController>(
        builder: (store) => Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: CustomPaint(
                  size: Size(size.width, 60),
                  painter: WPCustomPainter(),
                )),
            SizedBox(
              width: size.width,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _storeController.changeMainAppPage(AppPages.places);
                          },
                          icon: Icon(
                            _storeController.currentMainAppPage.value ==
                                    AppPages.places
                                ? GlobalConstants.placesPageSelectedIcon
                                : GlobalConstants.placesPageOutLinedIcon),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                              minWidth: 30, minHeight: 30),
                          splashRadius: 25,
                        ),
                        Text('strPlacesPageName'.tr, style: Get.textTheme.headline4,)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _storeController.changeMainAppPage(AppPages.map);
                          },
                          icon: Icon(
                              _storeController.currentMainAppPage.value ==
                                      AppPages.map
                                  ? GlobalConstants.mapPageSelectedIcon
                                  : GlobalConstants.mapPageOutLinedIcon),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                              minWidth: 30, minHeight: 30),
                          splashRadius: 25,
                        ),
                        Text('strMapPageName'.tr, style: Get.textTheme.headline4,)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class WPCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Get.theme.primaryColorDark
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 15);
    path.quadraticBezierTo(size.width * 0.5, -25, size.width, 15);
    path.lineTo(size.width, 60);
    path.lineTo(0, 60);
    canvas.drawShadow(path.shift(const Offset(0, -10)), Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
