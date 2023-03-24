import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/about_activity.dart';
import 'package:terapievim/screen/participant/home/home.dart';

import '../../../core/base/models/row_model.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                titleText(ActivityTextUtil.activity),
                activityminto(ActivityTextUtil.upcomingActivities, () {},
                    MainAxisAlignment.spaceBetween, true, IconUtility.forward),
                activityLoadseminar(),
                activityminto(ActivityTextUtil.pastActivities, () {},
                    MainAxisAlignment.spaceBetween, true, IconUtility.forward),
                activityPastseminar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ListView activityLoadseminar() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return ActivityBox(
          onTap: () {
            //  print("tıklıyorum ya");

            context.push(const AboutActivityScreen());
          },
          istwobutton: false,
          buttonText: ActivityTextUtil.join,
          containerModel: AppContainers.containerButton(false),
          isactivity: false,
          arowModel: DemoInformation.arowmodel,
          ayrowwModel: DemoInformation.ayrowmodel,
          clockModel: DemoInformation.clockmodel);
    },
    itemCount: 2,
  );
}

ListView activityPastseminar() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return ActivityBox(
          onTap: () {
            //  print("tıklıyorum ya");

            context.push(const AboutActivityScreen());
          },
          istwobutton: false,
          buttonText: ActivityTextUtil.watchTheRecording,
          containerModel: AppContainers.containerButton(false),
          isactivity: false,
          arowModel: DemoInformation.arowmodel,
          ayrowwModel: DemoInformation.ayrowmodel,
          clockModel: DemoInformation.clockmodel);
    },
    itemCount: 2,
  );
}

Widget activityminto(String text, Function()? onPressed,
    MainAxisAlignment mainAxisAlignment, bool isButterfly, Icon icon) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Text(
        text,
        style: isButterfly
            ? AppTextStyles.groupTextStyle(false)
            : AppTextStyles.normalTextStyle("medium", false),
      ),
      IconButton(
        icon: icon,
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



/*   search(UiBaseModel.searchModel(
                  ActivityTextUtil.searchText,
                  IconButton(
                    onPressed: () {
                      context.push(const FilterScreen());

                      //trendyolfiltreicondüzenleme
                    },
                    icon: IconUtility.fiterIcon,
                  ),
                )),*/