import 'dart:convert';
import 'dart:io';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/selected_image_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({Key? key}) : super(key: key);

  @override
  State<AddPersonForm> createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final listItemController = Get.put(ListItemController());
  final uploadImageController = Get.put(UploadImageController());

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
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            TextInput(
              label: 'Name',
              controller: nameTextEditingController,
            ),
            TextInput(
              label: 'Family Name',
              controller: familyTextEditingController,
            ),
            TextInput(
              label: 'Mobile',
              controller: mobileTextEditingController,
            ),
            TextInput(
              label: 'ID No.',
              controller: idTextEditingController,
            ),
            TextInput(
              label: 'Birth date',
              controller: birthTextEditingController,
            ),
            TextInput(
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
                    child: GestureDetector(
                      onTap: () => {chooseImage()},
                      child: Card(
                        child: (uploadImageController
                                    .imagebyteCode.value.length >
                                2)
                            ? Image.memory(
                                base64Decode(
                                    uploadImageController.imagebyteCode.value),
                                fit: BoxFit.cover,
                              )
                            : const Center(
                                child: Icon(Icons.photo),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Text('Must select an Image')
          ]),
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
      uploadImageController.getImage(img64);
    } else {
      print('picked image is null');
    }
  }
}

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const TextInput({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$label : '),
            FormTextField(
              controller: controller,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
