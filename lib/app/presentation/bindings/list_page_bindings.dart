import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/search_result_controller.dart';
import 'package:get/get.dart';

class ListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ListItemController>(ListItemController());
    Get.put<SearchController>(SearchController());
  }
}
