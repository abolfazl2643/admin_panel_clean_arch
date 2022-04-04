import 'dart:convert';
import 'package:espad_flutter_task_abolfazlrezaei/app/domain/interfaces/base_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonCard extends StatefulWidget {
  final int index;
  const PersonCard({
    Key? key,
    required this.personList,
    required this.index,
  }) : super(key: key);

  final BaseController personList;

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  final personList = Get.put(ListItemController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Card(
            color: personCardColor,
            shape: personCardShape,
            margin: personCardMargin,
            elevation: 12,
            child: Padding(
              padding: personCardContentPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.yellow,
                        height: Get.height / 4.7,
                        width: Get.height / 6,
                        child: Image.memory(
                          base64Decode(
                              widget.personList.list[widget.index].photo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Name : ', style: infoStyle),
                                SizedBox(height: 10),
                                Text('Family Name : ', style: infoStyle),
                                SizedBox(height: 10),
                                Text('Birth date ', style: infoStyle),
                                SizedBox(height: 10),
                                Text('ID No. ', style: infoStyle),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.personList.list[widget.index].name,
                                  style: infoStyle,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget
                                      .personList.list[widget.index].familyName,
                                  style: infoStyle,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget
                                      .personList.list[widget.index].birthDate,
                                  style: infoStyle,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.personList.list[widget.index].idNumber,
                                  style: infoStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.mode_edit_sharp),
                  color: Colors.grey,
                  onPressed: () {
                    personList.personIndex.value = widget.index;
                    Get.toNamed('/check-page');
                  },
                ),
                Checkbox(
                  onChanged: (bool? value) {
                    checkUncheck();
                  },
                  value: personList.list[widget.index].isChecked,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1.0,
            right: 15,
            child: Row(
              children: [
                Icon(
                  Icons.sell,
                  color: widget.personList.list[widget.index].approved
                      ? Colors.green
                      : Colors.red,
                ),
                SizedBox(width: Get.width / 3.2),
                TextButton(
                  style: checkButtonStyle,
                  onPressed: () {
                    personList.personIndex.value = widget.index;
                    Get.toNamed('/check-page');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("check"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void checkUncheck() {
    if (personList.list[widget.index].isChecked == true) {
      personList.list[widget.index].isChecked = false;
    } else {
      personList.list[widget.index].isChecked = true;
    }
    personList.list.sort((a, b) {
      if (b.isChecked) {
        return 1;
      }
      return -1;
    });
    setState(() {});
  }
}
