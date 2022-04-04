import 'package:flutter/material.dart';
import 'package:get/get.dart';

final theme = ThemeData();

const backgroundColor = Color(0xffF1F1F1);

const personCardColor = Color(0xffE3E3E3);

const submitButtonColor = Color(0xff57EFDD);

const cancelButtonColor = Color(0xffFF5050);

const personCardMargin = EdgeInsets.symmetric(
  vertical: 6,
  horizontal: 8,
);

var personCardContentPadding = EdgeInsets.symmetric(
  vertical: Get.height / 200,
  horizontal: Get.width / 40,
);

var searchFieldTextStyle = TextStyle(
    backgroundColor: Colors.white,
    fontSize: Get.width / 27,
    fontWeight: FontWeight.w300);

var checkButtonStyle = TextButton.styleFrom(
  minimumSize: Size.zero,
  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2), // and this

  backgroundColor: submitButtonColor,
  primary: Colors.white,
);

var backButtonStyle = TextButton.styleFrom(
  minimumSize: Size.zero,
  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2), // and this

  backgroundColor: cancelButtonColor,
  primary: Colors.white,
);

var saveButtonStyle = TextButton.styleFrom(
  minimumSize: Size.zero,
  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2), // and this

  backgroundColor: submitButtonColor,
  primary: Colors.white,
);

var personCardShape = RoundedRectangleBorder(
  side: const BorderSide(
    color: Colors.transparent,
    width: 0,
  ),
  borderRadius: BorderRadius.circular(12.0),
);

var searchFieldEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(9),
  borderSide: const BorderSide(color: Colors.white, width: 1.0),
);

const searchFieldContentPadding = EdgeInsets.symmetric(
  vertical: 10.0,
  horizontal: 10.0,
);

const infoStyle = TextStyle(
  fontWeight: FontWeight.w300,
);

var formFieldStyle = TextStyle(
    backgroundColor: Colors.transparent,
    fontSize: Get.width / 27,
    fontWeight: FontWeight.w300);

var formFieldDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: const EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 10.0,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Color.fromRGBO(112, 112, 112, 0.2),
      width: 2.0,
    ),
  ),
);
