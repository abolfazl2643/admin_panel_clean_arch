import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/UI/pages/form_add_page.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/UI/pages/main_page.dart';
import 'package:get/get_navigation/get_navigation.dart' as trans;
import 'package:get/get_navigation/get_navigation.dart';

var routes = [
  GetPage(
    name: '/',
    page: () => MainPage(),
    transition: trans.Transition.noTransition,
  ),
  GetPage(
    name: '/add-form',
    page: () => AddPersonForm(),
    transition: trans.Transition.noTransition,
  ),
];
