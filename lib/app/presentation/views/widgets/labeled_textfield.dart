import 'package:espad_flutter_task_abolfazlrezaei/app/presentation/views/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const LabeledTextField({
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
        const SizedBox(height: 15)
      ],
    );
  }
}
