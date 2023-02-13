import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});
  final TextEditingController activityTextController = TextEditingController();
  final ActivityController activityController = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _sizedbox(),
                CustomTextField(
                  isPhoneNumber: false,
                  isBig: true,
                  isPassword: true,
                  isRowModel: true,
                  rowModel: searchModel,
                  textController: activityTextController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Yaklaşan Aktiviteler"),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
                  ],
                ),
                ActivityBox(
                    containerModel: containerButton,
                    isactivity: true,
                    arowModel: arowmodel,
                    ayrowwModel: ayrowmodel,
                    clockModel: clockmodel),
                _sizedbox(),
                ActivityBox(
                    containerModel: containerButton,
                    isactivity: true,
                    arowModel: arowmodel,
                    ayrowwModel: ayrowmodel,
                    clockModel: clockmodel),
                _sizedbox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Geçmiş Aktiviteler"),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
                  ],
                ),
                ActivityBox(
                    containerModel: containerButton,
                    isactivity: true,
                    arowModel: arowmodel,
                    ayrowwModel: ayrowmodel,
                    clockModel: clockmodel),
                _sizedbox(),
                ActivityBox(
                    containerModel: containerButton,
                    isactivity: true,
                    arowModel: arowmodel,
                    ayrowwModel: ayrowmodel,
                    clockModel: clockmodel),
                CustomHeading(
                  text: "ss",
                  isalignmentstart: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

SizedBox _sizedbox() {
  return const SizedBox(
    height: 15,
  );
}
