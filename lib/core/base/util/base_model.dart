import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../screen/participant/group/category_determination/short_call/determining_to_shortcall_time.dart';
import '../component/group/row_view.dart';
import '../component/profile/image/custom_circle_avatar.dart';
import '../models/row_model.dart';
import 'base_utility.dart';

class UiBaseModel {
  static RowModel messageToTherapist = RowModel(
      leadingIcon: IconUtility.chatIcon,
      text: GroupTextUtil.messageToTherapist,
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: false);
  static RowModel searchModel(String text, Widget trailingIcon) => RowModel(
      isAlignmentBetween: true,
      text: text,
      leadingIcon: IconUtility.searchIcon,
      trailingIcon: trailingIcon,
      //   textStyle2: AppTextStyles.heading(false),
      textStyle: AppTextStyles.groupTextStyle(true));

//AppTextStyles.normalTextStyle("medium", true),
  static RowModel rowcontainer(bool isreminder) {
    const trailing = Padding(
      padding: EdgeInsets.only(left: 170.0),
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
  static boldMainTitleRowView(String text, String purpose, Function() onTap) =>
      rowView(
          RowModel(
              text: text,
              leadingIcon: Icon(
                purpose == 'group'
                    ? IconUtility.navGroup
                    : purpose == 'method'
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
          EdgeInsets.zero);
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
  static RowModel appBarModel(String text, Widget trailingIcon) => RowModel(
      text: text,
      textStyle: AppTextStyles.heading(false),
      trailingIcon: trailingIcon,
      isAlignmentBetween: true);

  //appRow

  static doubleappbarModel(
          String apptext, Widget leadingIcon, Widget trailingIcon) =>
      RowModel(
          trailingIcon: trailingIcon,
          text: apptext,
          textStyle: AppTextStyles.heading(false),
          leadingIcon: leadingIcon,
          isAlignmentBetween: true);

  static RowModel appBar() => appBarModel(GroupTextUtil.myGroupText,
      const SizedBox()); //GroupOut cikinca silinecek o buton

  static RowModel determiningappBar() =>
      appBarModel(GroupTextUtil.terapiEvim, saveButton());

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

  ///
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

  static personviewRowModel(String groupName) => RowModel(
      text: groupName,
      textStyle: AppTextStyles.normalTextStyle("medium", false),
      isAlignmentBetween: true,
      trailingIcon: IconUtility.arrowDown);

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
