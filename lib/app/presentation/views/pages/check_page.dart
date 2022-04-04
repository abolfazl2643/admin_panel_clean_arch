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
  final ListItemController personList = Get.find();
  final SelectedImageController selectedImageController = Get.find();
  final PersonRepository repository = PersonRepository();

  var nameApproved = false;
  var familyApproved = false;
  var mobileApproved = false;
  var idApproved = false;
  var birthApproved = false;
  var addressApproved = false;
  var photoApproved = false;

  @override
  Widget build(BuildContext context) {
    var approveList = [
      nameApproved,
      familyApproved,
      mobileApproved,
      idApproved,
      birthApproved,
      addressApproved,
      photoApproved,
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Name:'),
                  const SizedBox(width: 100),
                  Text(personList.list[personList.personIndex.value].name),
                  Switch(
                    value: nameApproved,
                    onChanged: (switchState) async =>
                        setState(() => nameApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Family Name:'),
                  const SizedBox(width: 100),
                  Text(
                      personList.list[personList.personIndex.value].familyName),
                  Switch(
                    value: familyApproved,
                    onChanged: (switchState) async =>
                        setState(() => familyApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Mobile:'),
                  const SizedBox(width: 100),
                  Text(personList.list[personList.personIndex.value].mobile),
                  Switch(
                    value: mobileApproved,
                    onChanged: (switchState) async =>
                        setState(() => mobileApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Id No. :'),
                  const SizedBox(width: 100),
                  Text(personList.list[personList.personIndex.value].idNumber),
                  Switch(
                    value: idApproved,
                    onChanged: (switchState) async =>
                        setState(() => idApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Birth date:'),
                  const SizedBox(width: 100),
                  Text(personList.list[personList.personIndex.value].birthDate),
                  Switch(
                    value: birthApproved,
                    onChanged: (switchState) async =>
                        setState(() => birthApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Address:'),
                  const SizedBox(width: 100),
                  Text(personList.list[personList.personIndex.value].address),
                  Switch(
                    value: addressApproved,
                    onChanged: (switchState) async =>
                        setState(() => addressApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Profile Pic : '),
                  SizedBox(
                    width: Get.width / 1.8,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: Obx(() => Card(
                            child: (selectedImageController
                                        .byteImage.value.length >
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
                  ),
                  Switch(
                    value: photoApproved,
                    onChanged: (switchState) async =>
                        setState(() => photoApproved = switchState),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: backButtonStyle,
                    onPressed: () => Get.toNamed('/'),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text("back"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    style: saveButtonStyle,
                    onPressed: () {
                      bool approved = true;
                      for (var element in approveList) {
                        if (element == false) {
                          approved = false;
                        }
                      }

                      repository.update(
                        editedPerson: Person(
                            idNumber: personList
                                .list[personList.personIndex.value].idNumber,
                            name: personList
                                .list[personList.personIndex.value].name,
                            familyName: personList
                                .list[personList.personIndex.value].familyName,
                            birthDate: personList
                                .list[personList.personIndex.value].birthDate,
                            address: personList
                                .list[personList.personIndex.value].address,
                            mobile: personList
                                .list[personList.personIndex.value].mobile,
                            photo: personList
                                .list[personList.personIndex.value].photo,
                            isChecked: true,
                            approved: approved),
                        index: personList.personIndex.value,
                      );
                      Get.toNamed('/');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text("save"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
