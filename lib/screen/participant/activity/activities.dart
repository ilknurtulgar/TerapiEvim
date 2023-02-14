import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

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
                search(),
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

  Padding search() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextField(
        isPhoneNumber: false,
        isBig: true,
        isPassword: true,
        isRowModel: true,
        rowModel: searchModel,
        textController: activityTextController,
      ),
    );
  }
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
