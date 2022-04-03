import 'dart:convert';
import 'package:espad_flutter_task_abolfazlrezaei/app/data/repositories/repository.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/domain/entities/person.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/selected_image_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckPersonPage extends StatefulWidget {
  const CheckPersonPage({Key? key}) : super(key: key);

  @override
  State<CheckPersonPage> createState() => _CheckPersonPageState();
}

class _CheckPersonPageState extends State<CheckPersonPage> {
  final personList = Get.put(ListItemController());
  final selectedImageController = Get.put(SelectedImageController());
  final PersonRepository repository = PersonRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              children: [
                const Text('Name:'),
                const SizedBox(width: 100),
                Text(personList.list[personList.personIndex.value].name),
                Switch(value: true, onChanged: (bool) async {})
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Family Name:'),
                const SizedBox(width: 100),
                Text(personList.list[personList.personIndex.value].familyName),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Mobile:'),
                const SizedBox(width: 100),
                Text(personList.list[personList.personIndex.value].mobile),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Id No. :'),
                const SizedBox(width: 100),
                Text(personList.list[personList.personIndex.value].idNumber),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Birth date:'),
                const SizedBox(width: 100),
                Text(personList.list[personList.personIndex.value].birthDate),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Address:'),
                const SizedBox(width: 100),
                Text(personList.list[personList.personIndex.value].address),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Profile Pic : '),
                SizedBox(
                  width: Get.width / 1.6,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Obx(() => Card(
                          child:
                              (selectedImageController.byteImage.value.length >
                                      2)
                                  ? Image.memory(
                                      base64Decode(personList
                                          .list[personList.personIndex.value]
                                          .photo),
                                      fit: BoxFit.cover,
                                    )
                                  : const Center(
                                      child: Icon(Icons.photo),
                                    ),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: 2), // and this

                    backgroundColor: cancelButtonColor,
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Get.toNamed('/');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("back"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: 2), // and this

                    backgroundColor: submitButtonColor,
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    repository.add(Person(
                        idNumber: personList
                            .list[personList.personIndex.value].idNumber,
                        name:
                            personList.list[personList.personIndex.value].name,
                        familyName: personList
                            .list[personList.personIndex.value].familyName,
                        birthDate: personList
                            .list[personList.personIndex.value].birthDate,
                        address: personList
                            .list[personList.personIndex.value].address,
                        mobile: personList
                            .list[personList.personIndex.value].mobile,
                        photo:
                            personList.list[personList.personIndex.value].photo,
                        isChecked: true));

                    Get.toNamed('/');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("save"),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
