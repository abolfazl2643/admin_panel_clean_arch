import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/search_result_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/widgets/person_card.dart';
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
  final ListItemController personList = Get.find();
  final SearchController searchResultController = Get.find();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        searchResultController.isSearchResult.value = false;
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: submitButtonColor,
          onPressed: () {
            searchResultController.isSearchResult.value = false;
            Get.toNamed('/add-page');
          },
          child: const Icon(Icons.add),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mq.height / 6.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SearchBar(textEditingController: searchTextEditingController),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        personList.list.removeWhere(
                            (element) => element.isChecked == true);
                      },
                    ),
                    Obx(
                      () => Checkbox(
                        value: personList.allSelected.value,
                        onChanged: (value) {
                          personList.allSelected.value = value!;
                          for (var person in personList.list) {
                            person.isChecked = value;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: searchResultController.isSearchResult.value == true
                ? searchResultController.list.length
                : personList.list.length,
            itemBuilder: (context, index) => PersonCard(
              personList: searchResultController.isSearchResult.value == true
                  ? searchResultController
                  : personList,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
