import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/group/p_determining_short_call_time.dart';
import 'package:terapievim/controller/therapist/message/t_message_all_users_list_controller.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';

import '../../../screen/participant/group/category_determination/short_call/p_determining_to_shortcall_time_view.dart';
import '../component/group/row_view.dart';
import '../component/profile/image/custom_circle_avatar.dart';
import 'base_utility.dart';

class UiBaseModel {
  static RowModel messageToTherapist = RowModel(
      leadingIcon: IconUtility.chatIcon,
      text: GroupTextUtil.messageToTherapist,
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: true);
  static RowModel searchModel(String text, Widget trailingIcon) => RowModel(
      isAlignmentBetween: true,
      text: text,
      leadingIcon: IconUtility.searchIcon,
      trailingIcon: trailingIcon,
      //   textStyle2: AppTextStyles.heading(false),
      textStyle: AppTextStyles.groupTextStyle(true));

//AppTextStyles.normalTextStyle("medium", true),
  static RowModel rowcontainer(bool isreminder, BuildContext context) {
    double width = Responsive.width(150, context);
    final trailing = Padding(
      padding: EdgeInsets.only(left: width),
      child: IconUtility.forward,
    );
    return RowModel(
        text: isreminder ? HomeTextUtil.reminder : HomeTextUtil.notification,
        textStyle: AppTextStyles.groupTextStyle(true),
        leadingIcon: IconUtility.notification,
        trailingIcon: isreminder ? trailing : null,
        isAlignmentBetween: false);
  }

//profil page util
  static RowModel doubleTextRow(
          String firstText, String secondText, bool isInParticipantPage) =>
      RowModel(
          // ana ve yardımcı terapist için
          text: firstText,
          textStyle: AppTextStyles.profileTextStyles(false, true),
          text2: secondText,
          textStyle2: AppTextStyles.normalTextStyle('medium', false),
          leadingIcon: Icon(
            isInParticipantPage
                ? IconUtility.personIcon.icon
                : IconUtility.navProfile,
            color: Colors.black,
          ),
          isAlignmentBetween: false);
  static boldMainTitleRowView(
          String text, MainTitles whichMainTitle, Function() onTap) =>
      RowView(
          rowModel: RowModel(
              text: text,
              leadingIcon: Icon(
                whichMainTitle == MainTitles.groups //'group'
                    ? IconUtility.navGroup
                    : whichMainTitle == MainTitles.methods //'method'
                        ? IconUtility.fileIcon.icon
                        : IconUtility.windowsIcon.icon,
                color: AppColors.black,
                size: 25,
              ),
              textStyle: AppTextStyles.profileTextStyles(true, true),
              isAlignmentBetween: false,
              trailingIcon: Padding(
                padding: EdgeInsets
                    .zero, // EdgeInsets.only(left: text.length < 15 ? 160 : 80),
                child: IconButton(
                    onPressed: onTap,
                    alignment: Alignment.centerLeft,
                    icon: IconUtility.forward),
              )),
          padding: EdgeInsets.zero);
  static RowModel normalTextRow(
          String text, IconData icon, TextStyle textStyle) =>
      RowModel(
          text: text,
          leadingIcon: Icon(
            icon,
            color: AppColors.black,
          ),
          textStyle: textStyle,
          isAlignmentBetween: false);

//üstdekiyle aynı icondata ayarlanması gerek.!
  static RowModel aboutrowmodel(String headingtext, Icon leadingIcon) {
    return RowModel(
        text: headingtext,
        textStyle: AppTextStyles.groupTextStyle(true),
        leadingIcon: leadingIcon,
        isAlignmentBetween: false);
  }

  static RowModel filterdetails(BuildContext context) => RowModel(
      text: ActivityTextUtil.psychologist,
      trailingIcon: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: IconUtility.checkCircleIcon),
      textStyle: AppTextStyles.normalTextStyle("big", false),
      leadingIcon: IconButton(onPressed: () {}, icon: IconUtility.back),
      isAlignmentBetween: true);

  ///

  static RowModel secDeterminationModel(String text, Widget leadingIcon) =>
      RowModel(
          isAlignmentBetween: false,
          textStyle: AppTextStyles.groupTextStyle(false),
          text: text,
          leadingIcon: leadingIcon);

  static RowModel rowModel(String rowmodeltext) {
    return RowModel(
        text: rowmodeltext,
        textStyle: AppTextStyles.groupTextStyle(false),
        isAlignmentBetween: true,
        trailingIcon: IconUtility.forward);
  }

  static RowModel appBarModel(String text, Widget trailingIcon) => RowModel(
      text: text,
      textStyle: AppTextStyles.heading(false),
      trailingIcon: trailingIcon,
      isAlignmentBetween: true);
  static RowModel determiningappBar(
          BuildContext context, PDeterminingShortCallController controller) =>
      appBarModel(GroupTextUtil.terapiEvim, saveButton(context, controller));
  static RowModel roleModel(String text, Widget leadingIcon) => RowModel(
        text: text,
        textStyle: AppTextStyles.groupTextStyle(false),
        isAlignmentBetween: false,
        leadingIcon: leadingIcon,
      );
  static basetmeMetotlari() =>
      roleModel(TherapistProfileTextUtil.methods, IconUtility.fileIcon);

  static seminerleri() =>
      roleModel(TherapistProfileTextUtil.seminars, IconUtility.activityIcon);

  static mesajGonder() =>
      roleModel(GroupTextUtil.sendMessageText, IconUtility.chatIcon);

  static personviewRowModel(String groupName,
          TMessageAllUsersListController controller, int index) =>
      RowModel(
          text: groupName,
          textStyle: AppTextStyles.normalTextStyle("medium", false),
          isAlignmentBetween: true,
          trailingIcon: controller.isOpen[index].isTrue
              ? IconUtility.arrowUp
              : IconUtility.arrowDown);

  static groupInfoPerson(String name) => RowModel(
      text: name,
      leadingIcon: CustomCircleAvatar(
          big: false, imagePath: DemoInformation.imagePath, shadow: false),
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: true,
      trailingIcon: IconUtility.deleteIcon);
  static secRowModel(Widget trailingIcon, String text) => RowModel(
      trailingIcon: trailingIcon,
      text: text,
      textStyle: AppTextStyles.heading(false),
      isAlignmentBetween: true);
  static leadinfRowModel(Widget leadingIcon, String text, bool isHeading) =>
      RowModel(
          text: text,
          textStyle: AppTextStyles.heading(isHeading),
          leadingIcon: leadingIcon,
          isAlignmentBetween: true);
}
