import 'package:espad_flutter_task_abolfazlrezaei/app/domain/entities/person.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/domain/interfaces/base_repository.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:get/get.dart';

abstract class Repository implements BaseRepository {
  //no api call or real database yet!
  var listItemController = Get.put(ListItemController());

  @override
  void update({required int index, required Person editedPerson}) {
    listItemController.list[index] = editedPerson;
  }

  @override
  Person get(int index) {
    return listItemController.list[index];
  }

  @override
  void delete(int index) {
    listItemController.list.removeAt(index);
  }

  @override
  void add(Person person) {
    listItemController.list.add(person);
  }
}
