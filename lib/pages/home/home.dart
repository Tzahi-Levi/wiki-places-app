// ================= Home Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/global/store_controller.dart';

import 'package:wiki_places/widgets/languages_drop_down.dart';
import 'package:wiki_places/widgets/theme_switcher.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:wiki_places/metrics/google_analytics.dart';
import 'package:sentry/sentry.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final storeController = Get.put(StoreController());

  void func1() {
    GoogleAnalytics.instance.logErrorExample();
    FirebaseCrashlytics.instance.crash();
  }

  void func2() async {
    try {
      3/0;
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    GoogleAnalytics.instance.logErrorExample();
    FirebaseCrashlytics.instance.crash();
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
              ThemeSwitcher(),
              LanguageDropDown(),
              TextButton(onPressed: func1, child: Text("Crashlitics")),
              TextButton(onPressed: func2, child: Text("Sentry")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: storeController.increase,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
