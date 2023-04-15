import 'package:flutter/material.dart';

import '../../../../core/base/component/login/custom_textfield.dart';

class TextsField extends StatelessWidget {
  const TextsField(
      {super.key, this.maxLines, required this.textEditingController});
  final int? maxLines;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        isOne: true,
        maxLines: maxLines,
        isBig: true,
        textController: textEditingController,
        isRowModel: false);
  }
}

class EventName extends StatelessWidget {
  const EventName({super.key, required this.activityNameController});
  final TextEditingController activityNameController;
  @override
  Widget build(BuildContext context) {
    return TextsField(
        textEditingController: activityNameController, maxLines: 2);
  }
}

class EventAbout extends StatelessWidget {
  const EventAbout({super.key, required this.activityDescriptionController});
  final TextEditingController activityDescriptionController;
  @override
  Widget build(BuildContext context) {
    return TextsField(
        textEditingController: activityDescriptionController, maxLines: 10);
  }
}
