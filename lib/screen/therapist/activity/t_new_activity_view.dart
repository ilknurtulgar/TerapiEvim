import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/activity/t_new_activity_view_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';

import '../../../controller/therapist/activity/t_activity_controller.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/login/custom_textfield.dart';
import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../screen/therapist/group/group_add/t_group_add_view.dart';

class TNewActivityView extends StatefulWidget {
  const TNewActivityView({super.key, this.activity});

  final TActivityModel? activity;

  @override
  State<TNewActivityView> createState() => _TNewActivityViewState();
}

TActivityController therapistActivityController = Get.find();

class _TNewActivityViewState extends State<TNewActivityView> {
  @override
  void initState() {
    if (widget.activity != null) {
      therapistActivityController.activitynamController.text =
          widget.activity?.title ?? '';
      therapistActivityController.activitydescriptionController.text =
          widget.activity?.description ?? '';

      ///TODO handle others controllers
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TNewActivityViewController>(
      getController: TNewActivityViewController(),
      onPageBuilder: (context, TNewActivityViewController controller) =>
          Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.newActivity),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                miniHeadings(ActivityTextUtil.eventName, false, false),
                eventname(),
                miniHeadings(ActivityTextUtil.eventAbout, false, false),
                eventabout(),
                dateclockrow(),
                dateclocktextfield(),
                butterFlyButton(ActivityTextUtil.create, () {
                  therapistActivityController.createActivity(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  eventname() {
    return textfield(therapistActivityController.activitynamController, 2);
  }

  Widget eventabout() {
    return textfield(
        therapistActivityController.activitydescriptionController, 10);
  }

  Widget dateclocktextfield() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: textfield(
                therapistActivityController.activitydateController, 2)),
        Expanded(
            child: textfield(
                therapistActivityController.activitytimeController, 2)),
      ],
    );
  }

  Row dateclockrow() {
    // miniHeading ve container ikisi beraber bir column olarak extract edilecek 2 tanesi yan yana kullanılacak
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: miniHeadings(ActivityTextUtil.date, false, false)),
        // activityname(ActivityTextUtil.date, AppPaddings.startpadding),
        Expanded(child: miniHeadings(ActivityTextUtil.clock, true, false))
        // activityname(ActivityTextUtil.clock, AppPaddings.centerpadding),
      ],
    );
  }

  Widget textfield(TextEditingController textEditingController, int maxLines) {
    return Padding(
      padding: AppPaddings.generalPadding,
      child: CustomTextField(
          isOne: true,
          maxLines: maxLines,
          isBig: true,
          textController: textEditingController,
          isRowModel: false),
    );
  }

  Padding activityname(String activityheading, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          activityheading,
          style: AppTextStyles.groupTextStyle(false),
        ),
      ),
    );
  }
}

Align butterFlyButton(String buttonname, Function() onTap) {
  return Align(
    alignment: Alignment.bottomRight,
    child: CustomButton(
        container: AppContainers.containerButton(true),
        textColor: AppColors.white,
        onTap: onTap,
        text: buttonname),
  );
}

Widget secappview(RowModel rowModel) {
  return RowView(rowModel: rowModel, padding: AppPaddings.mediumxPadding);
}
