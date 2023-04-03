import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/participant/p_activity_controller.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/component/login/custom_textfield.dart';
import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../../../service/model/common/activity/t_activity_model.dart';
import '../home/home.dart';
import 'about_activity.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  late final PActivityController _pActivityController;

  @override
  void initState() {
    _pActivityController = Get.put(PActivityController());
    super.initState();
  }

  @override
  void dispose() {
    _pActivityController.dispose();
    Get.delete<PActivityController>();
    super.dispose();
  }

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
                activityLoadSeminar(_pActivityController),
                activityminto(ActivityTextUtil.pastActivities, () {},
                    MainAxisAlignment.spaceBetween, true, IconUtility.forward),
                activityPastSeminar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget activityLoadSeminar(PActivityController pActivityController) {
  return Obx(
    () => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pActivityController.recentActivities.length,
      itemBuilder: (context, index) {
        final TActivityModel activity =
            pActivityController.recentActivities[index]!;
        return activitythreerowbox(() {
          context.push(const AboutActivityScreen());
        }, () {
          pActivityController.joinActivity(context, activity);
        },
            DemoInformation.recentActivity(activity.therapistName ?? ''),
            DemoInformation.recentActivityTime(
                activity.dateTime ?? Timestamp.now()),
            ActivityTextUtil.join);
      },
    ),
  );
}

Widget activitythreerowbox(Function()? onButtonTap, Function()? onTap,
    RowModel arowModel, RowModel clockModel, String buttonText) {
  return ActivityBox(
      onTap: onTap,
      istwobutton: false,
      buttonText: buttonText,
      containerModel: AppContainers.containerButton(false),
      arowModel: arowModel,
      isactivity: false,
      clockModel: clockModel,
      onButtonTap: onButtonTap);
}

ListView activityPastSeminar() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return activitythreerowbox(() {
        context.push(const AboutActivityScreen());
      }, () {}, DemoInformation.arowmodel, DemoInformation.clockmodel,
          ActivityTextUtil.watchTheRecording);
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

//TODO: it should not be initialized outside a class
//TODO: it should not be used except for activityView
final TextEditingController activityTextController = TextEditingController();

Widget search(RowModel rowModel) {
  return CustomTextField(
    isOne: true,
    isBig: true,
    isRowModel: true,
    rowModel: rowModel,
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
