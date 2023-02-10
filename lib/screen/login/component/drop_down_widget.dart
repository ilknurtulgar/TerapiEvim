import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/group_controller.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({
    super.key,
  });

  // int? selectedValue;
  GroupController groupController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(
        () => DropdownButton<int>(
            value: groupController.selectedValue.value,
            items: [
              DropdownMenuItem(
                child: Text("kadın"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("erkek "),
                value: 2,
              ),
            ],
            onChanged: (value) {
              groupController.dropvalue(value);
            }),
      ),
    );
  }
}
