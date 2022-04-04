import 'dart:convert';
import 'dart:io';
import 'package:espad_flutter_task_abolfazlrezaei/app/data/repositories/repository.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/domain/entities/person.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/selected_image_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/widgets/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({Key? key}) : super(key: key);

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final listItemController = Get.put(ListItemController());
  final selectedImageController = Get.put(SelectedImageController());
  final PersonRepository repository = PersonRepository();
  final nameTextEditingController = TextEditingController();
  final familyTextEditingController = TextEditingController();
  final mobileTextEditingController = TextEditingController();
  final idTextEditingController = TextEditingController();
  final birthTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Form(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              LabeledTextField(
                label: 'Name',
                controller: nameTextEditingController,
              ),
              LabeledTextField(
                label: 'Family Name',
                controller: familyTextEditingController,
              ),
              LabeledTextField(
                label: 'Mobile',
                controller: mobileTextEditingController,
              ),
              LabeledTextField(
                label: 'ID No.',
                controller: idTextEditingController,
              ),
              LabeledTextField(
                label: 'Birth date',
                controller: birthTextEditingController,
              ),
              LabeledTextField(
                label: 'Address',
                controller: addressTextEditingController,
              ),
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
                      child: Obx(() => GestureDetector(
                            onTap: () => {chooseImage()},
                            child: Card(
                              child: (selectedImageController
                                          .byteImage.value.length >
                                      2)
                                  ? Image.memory(
                                      base64Decode(selectedImageController
                                          .byteImage.value),
                                      fit: BoxFit.cover,
                                    )
                                  : const Center(
                                      child: Icon(Icons.photo),
                                    ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
              const Text('Must select an Image'),
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
                          idNumber: idTextEditingController.text,
                          name: nameTextEditingController.text,
                          familyName: familyTextEditingController.text,
                          birthDate: birthTextEditingController.text,
                          address: addressTextEditingController.text,
                          mobile: mobileTextEditingController.text,
                          photo: selectedImageController.byteImage.toString(),
                          isChecked: true,
                          approved: false));
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
      ),
    );
  }

  chooseImage() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final bytes = File(image.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      selectedImageController.setImage(img64);
    } else {
      print('picked image is null');
    }
  }
}
