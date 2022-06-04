// ================= Bottom Navigation Widget =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/types.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);
  final Size size = Size(Get.width, Get.height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: CustomPaint(
            size: Size(size.width, 60),
            painter: WPCustomPainter(),
          ),
        ),
        SizedBox(
          width: size.width,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavigationButton(page: EAppPages.favorites, pageName: 'strFavoritesPageName'.tr, selectedIcon: GlobalConstants.favoriteIcon, nonSelectedIcon: GlobalConstants.nonFavoriteIcon),
                NavigationButton(page: EAppPages.places, pageName: 'strPlacesPageName'.tr, selectedIcon: GlobalConstants.placesPageSelectedIcon, nonSelectedIcon: GlobalConstants.placesPageOutLinedIcon),
                NavigationButton(page: EAppPages.map, pageName: 'strMapPageName'.tr, selectedIcon: GlobalConstants.mapPageSelectedIcon, nonSelectedIcon: GlobalConstants.mapPageOutLinedIcon),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NavigationButton extends StatelessWidget {
  NavigationButton({Key? key, required this.page, required this.pageName, required this.selectedIcon, required this.nonSelectedIcon}) : super(key: key);
  final EAppPages page;
  final String pageName;
  final IconData selectedIcon;
  final IconData nonSelectedIcon;
  final _storeController = Get.put(StoreController());

  void _navigateToPage() {
    Get.back(closeOverlays: true);
    _storeController.updateMainAppPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (store) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _navigateToPage,
              icon: Icon(_storeController.currentMainAppPage.value == page ? selectedIcon : nonSelectedIcon , color: _storeController.currentMainAppPage.value == page ? Get.theme.primaryColor : null,),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              splashRadius: 25,
            ),
            Text(pageName, style: _storeController.currentMainAppPage.value == page ? GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal, color: Get.theme.primaryColor) : Get.textTheme.headline4),
          ],
        ),
    );
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
