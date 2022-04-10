// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/store_controller.dart';


import 'package:wiki_places/widgets/languages_drop_down.dart';
import 'package:wiki_places/widgets/theme_switcher.dart';
import 'package:wiki_places/global/client_requests.dart';

class HomePage extends StatelessWidget {
  final storeController = Get.put(StoreController());

  void func() async {
    Response x = await ClientRequests.instance.getPlacesData("1km", "32.7775", "35.02166667");
    print(x.body);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<StoreController>(
      builder: (sController) =>  Scaffold(
        appBar: AppBar(
          title: Text('title'.tr),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${storeController.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
              LanguageDropDown(),
              ThemeSwitcher(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: func,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
