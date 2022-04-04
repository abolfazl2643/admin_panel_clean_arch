import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  var list = [].obs;
  var personIndex = 0.obs;
  var allSelected = false.obs;
}
