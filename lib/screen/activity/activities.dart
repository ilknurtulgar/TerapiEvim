import 'package:flutter/material.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';
import 'package:terapievim/screen/login/component/custom_textfield.dart';
import 'package:terapievim/screen/group/component/group_box.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});
  final TextEditingController activityTextController = TextEditingController();
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
