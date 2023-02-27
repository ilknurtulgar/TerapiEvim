import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/about_activity.dart';

import '../../../core/base/models/row_model.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                search(searchModel),
                activityminto("Yaklaşan Aktiviteler", () {}),
                activityseminar(),
                activityminto("Geçmiş Aktiviteler", () {}),
                activityseminar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ListView activityseminar() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 70,
          top: 20,
          right: 70,
        ),
        child: ActivityBox(
            onTap: () {
              print("tıklıyorum ya");
              Get.to(const AboutActivityScreen());
            },
            istwobutton: false,
            buttonText: "Katıl",
            containerModel: AppContainers.containerButton(false),
            isactivity: false,
            arowModel: DemoInformation.arowmodel,
            ayrowwModel: DemoInformation.ayrowmodel,
            clockModel: DemoInformation.clockmodel),
      );
    },
    itemCount: 2,
  );
}

Widget activityminto(String text, Function()? onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        text,
        style: AppTextStyles.groupTextStyle(false),
      ),
      IconButton(
        icon: IconUtility.arrowIcon,
        onPressed: onPressed,
      ),
    ],
  );
}

final TextEditingController activityTextController = TextEditingController();

Widget search(RowModel rowmodel) {
  return CustomTextField(
    isPhoneNumber: false,
    isBig: true,
    isPassword: false,
    isRowModel: true,
    rowModel: rowmodel,
    textController: activityTextController,
  );
}

SizedBox sizedbox() {
  return const SizedBox(
    height: 15,
  );
}
