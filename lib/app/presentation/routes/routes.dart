import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/pages/add_page.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/pages/check_page.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/pages/list_page.dart';
import 'package:get/get_navigation/get_navigation.dart' as trans;
import 'package:get/get_navigation/get_navigation.dart';

var routes = [
  GetPage(
    name: '/',
    page: () => const MainPage(),
    transition: trans.Transition.noTransition,
  ),
  GetPage(
    name: '/add-page',
    page: () => const AddPersonPage(),
    transition: trans.Transition.noTransition,
  ),
  GetPage(
    name: '/check-page',
    page: () => const CheckPersonPage(),
    transition: trans.Transition.noTransition,
  ),
];
