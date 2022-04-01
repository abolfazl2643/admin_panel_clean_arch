import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/UI/themes/style.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/add-form',
      getPages: routes,
      smartManagement: SmartManagement.full,
      theme: theme,
    );
  }
}
