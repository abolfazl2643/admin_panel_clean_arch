import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/list_item_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/states/search_result_controller.dart';
import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController textEditingController;

  const SearchBar({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final personList = Get.put(ListItemController());
  final searchResult = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: PhysicalModel(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          elevation: 6.0,
          shadowColor: Colors.grey,
          child: TextField(
            controller: widget.textEditingController,
            style: searchFieldTextStyle,
            onSubmitted: (value) {
              getSearchResult(widget.textEditingController.text);
            },
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: IconButton(
                icon: Icon(
                  CupertinoIcons.search,
                  size: Get.width / 15,
                  color: Colors.grey,
                ),
                onPressed: () {
                  getSearchResult(widget.textEditingController.text);
                },
              ),
              contentPadding: searchFieldContentPadding,
              enabledBorder: searchFieldEnabledBorder,
            ),
          ),
        ),
      ),
    );
  }

  void getSearchResult(String keyword) {
    var searchedReslut = personList.list
        .where((person) => person.name == keyword || person.isChecked == true)
        .toList();
    searchResult.isSearchResult.value = true;
    searchResult.list.value = searchedReslut;
  }
}
