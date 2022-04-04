import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/bindings/add_page_bindings.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/bindings/check_page_bindings.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/bindings/list_page_bindings.dart';
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
    binding: ListPageBinding(),
  ),
  GetPage(
    name: '/add-page',
    page: () => const AddPersonPage(),
    transition: trans.Transition.noTransition,
    binding: AddPageBinding(),
  ),
  GetPage(
    name: '/check-page',
    page: () => const CheckPersonPage(),
    transition: trans.Transition.noTransition,
    binding: CheckPageBinding(),
  ),
];
