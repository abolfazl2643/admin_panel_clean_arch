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
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          minLines: 1,
          validator: (value) {
            return null;
          },
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          style: TextStyle(
              backgroundColor: Colors.transparent,
              fontSize: Get.width / 27,
              fontWeight: FontWeight.w300),
          decoration: InputDecoration(
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
          ),
        ),
      ),
    );
  }
}
