import 'package:espad_flutter_task_abolfazlrezaei/app/domain/entities/person.dart';

abstract class BaseRepository {
  void update({required int index, required Person editedPerson});
  void delete(int index);
  void add(Person person);
  Person get(int index);
}
