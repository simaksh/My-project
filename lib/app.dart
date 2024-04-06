import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled121/src/infrastructure/commons/route-name.dart';
import 'package:untitled121/src/infrastructure/commons/route-page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        initialRoute: RouteName.login,
        getPages: RoutePage.pages,
        debugShowCheckedModeBanner: false,
      );
}
