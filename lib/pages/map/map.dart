// ================= Map Page =================
import 'package:flutter/material.dart';

import '../../widgets/appbar.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WikiPlacesAppBar(),
      body: Center(child: Text("Map")),
    );
  }
}
