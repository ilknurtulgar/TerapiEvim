import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

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
              containerModel: containerButton,
              isactivity: true,
              arowModel: arowmodel,
              ayrowwModel: ayrowmodel,
              clockModel: clockmodel),
        );
      },
      itemCount: 2,
    );
  }

  Padding activityminto(String text, Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
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
      ),
    );
  }
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

SizedBox _sizedbox() {
  return const SizedBox(
    height: 15,
  );
}

//deneme
ContainerModel containerButton = ContainerModel(
    height: 30,
    borderRadius: 100,
    width: 97,
    backgroundColor: AppColors.meteorite);
