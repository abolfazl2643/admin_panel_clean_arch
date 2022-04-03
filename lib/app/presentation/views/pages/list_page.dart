import 'dart:convert';

import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var searchTextEditingController = TextEditingController();
  var listItemController = Get.put(ListItemController());
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: submitButtonColor,
        onPressed: () {
          Get.toNamed('/add-page');
        },
        child: const Icon(Icons.add),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          mq.height / 9,
        ),
        child: Card(
          color: backgroundColor,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: SearchBar(
                  textEditingController: searchTextEditingController,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listItemController.list.length,
        itemBuilder: (context, index) => Obx(
          () => Stack(
            children: [
              Card(
                color: personCardColor,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 8,
                ),
                elevation: 12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height / 200,
                    horizontal: Get.width / 40,
                  ),
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
                                  listItemController.list[index].photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 35.0, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Name : ',
                                      style: infoStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Family Name : ',
                                      style: infoStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Birth date ',
                                      style: infoStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'ID No. ',
                                      style: infoStyle,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listItemController.list[index].name,
                                      style: infoStyle,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      listItemController.list[index].familyName,
                                      style: infoStyle,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      listItemController.list[index].birthDate,
                                      style: infoStyle,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      listItemController.list[index].idNumber,
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
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  IconButton(
                    icon: const Icon(Icons.mode_edit_sharp),
                    color: Colors.grey,
                    onPressed: () {
                      listItemController.personIndex.value = index;
                      Get.toNamed('/check-page');
                    },
                  ),
                  Checkbox(
                    onChanged: (bool? value) {},
                    value: false,
                  ),
                ]),
              ),
              Positioned(
                bottom: 1.0,
                right: 15,
                child: Row(
                  children: [
                    const Icon(
                      Icons.sell,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 100),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 2), // and this

                        backgroundColor: submitButtonColor,
                        primary: Colors.white,
                      ),
                      onPressed: () {},
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
        ),
      ),
    );
  }
}
