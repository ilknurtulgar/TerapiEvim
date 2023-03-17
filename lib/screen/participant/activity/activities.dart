import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/about_activity.dart';

import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_model.dart';
import 'a_filter.dart';

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
                search(UiBaseModel.searchModel(
                  ActivityTextUtil.searchText,
                  IconButton(
                    onPressed: () {
                      context.push(const FilterScreen());

                      //trendyolfiltreicondüzenleme
                    },
                    icon: IconUtility.fiterIcon,
                  ),
                )),
                activityminto(ActivityTextUtil.upcomingActivities, () {},
                    MainAxisAlignment.spaceAround, true, IconUtility.forward),
                activityseminar(),
                activityminto(ActivityTextUtil.pastActivities, () {},
                    MainAxisAlignment.spaceAround, true, IconUtility.forward),
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
        padding: AppPaddings.activitySeminarPadding,
        child: ActivityBox(
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
            clockModel: DemoInformation.clockmodel),
      );
    },
    itemCount: 2,
  );
}

Widget activityminto(String text, Function()? onPressed,
    MainAxisAlignment mainAxisAlignment, bool isButterfly, Icon icon) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: isButterfly
              ? AppTextStyles.groupTextStyle(false)
              : AppTextStyles.normalTextStyle("medium", false),
        ),
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
