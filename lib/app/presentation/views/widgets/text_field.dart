import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;

  const FormTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: Get.height / 20,
        width: Get.width / 1.6,
        child: TextFormField(
          controller: widget.controller,
          onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          style: formFieldStyle,
          decoration: formFieldDecoration,
        ),
      ),
    );
  }
}
