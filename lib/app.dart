import 'package:espad_flutter_task_abolfazlrezaei/routes/routes.dart';
import 'package:espad_flutter_task_abolfazlrezaei/view/themes/style.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      routes: routes,
      initialRoute: '/',
    );
  }
}