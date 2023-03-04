import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/therapist/group/metots/new_metot.dart';
import 'package:terapievim/screen/therapist/group/therapist_about.dart';
import '../../../../core/base/component/buttons/election.dart';
import '../../../../core/base/component/group/person.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';

// ignore: must_be_immutable
class GroupInformation extends StatelessWidget {
  GroupInformation({super.key});
  TherapistGroupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    List<PersonMin> participantRow = [
      person("Ali Kiran", context),
      person("Yasemin Atmaca", context),
      person("Kerem Bursin", context),
      person("Osman Yigit", context),
      person("Ali Kiran", context)
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              heading(context),
              miniHeadings(GroupTextUtil.upcomingMeetingText, false),
              meeting(),
              miniHeadings(GroupTextUtil.groupsInformationText, false),
              navMethod(DemoInformation.secTherapist, () {
                Get.to(TherapistProfile(
                  isSecTherapist: true,
                ));
              }),
              Election(
                  election:
                      ControllerElection.therapistGroupControllerParticipant,
                  firstRow: Obx(() => SizedBox(
                        child: SeminarMin(
                          borderColor: AppColors.meteorite,
                          onTap: () {
                            controller.changeParticipantElection();
                          },
                          row: RowModel(
                            text: GroupTextUtil.participantsText,
                            textStyle: AppTextStyles.aboutMeTextStyle(false),
                            leadingIcon: IconUtility.groupsIcon,
                            isAlignmentBetween: true,
                            trailingIcon: Icon(
                              controller.isParticipantElectionOpen.isTrue
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down_sharp,
                              size: 38,
                            ),
                          ),
                        ),
                      )),
                  rows: participantRow),
              navMethod(DemoInformation.methods, () {
                //method sayfasina gidecek
              }),
            ],
          ),
        ),
      ),
    );
  }

  ActivityBox meeting() {
    return ActivityBox(
        istwobutton: false,
        containerModel: AppContainers.containerButton(false),
        buttonText: GroupTextUtil.startText,
        arowModel: RowModel(
          leadingIcon: IconUtility.personIcon,
          isAlignmentBetween: false,
          text: GroupTextUtil.secondTherapistText,
          textStyle: AppTextStyles.aboutMeTextStyle(false),
          text2: "Ozlem Ulusan", //sadece isim alinacak
          textStyle2: AppTextStyles.groupTextStyle(true),
        ),
        isactivity: true,
        clockModel: RowModel(
          leadingIcon: IconUtility.clockIcon,
          text: "Ocak 15, 2023,  20:00",
          textStyle: AppTextStyles.groupTextStyle(true),
          isAlignmentBetween: false,
        ));
  }

  Padding navMethod(RowModel row, Function() func) {
    return Padding(
      padding: AppPaddings.tGroupMetotPadding,
      child:
          SeminarMin(borderColor: AppColors.meteorite, onTap: func, row: row),
    );
  }

  Widget heading(BuildContext context) {
    return rowView(
        RowModel(
            leadingIcon: const Icon(Icons.arrow_back_ios_new),
            text: "Anksiyete 1",
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: true,
            trailingIcon: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_document),
                  onPressed: () {
                    Get.to(const NewMetot());
                    //new Metot sayfasina godocek
                  },
                ),
                IconButton(
                  icon: IconUtility.deleteIcon,
                  onPressed: () {
                    deleteGroupDialog(context);
                  },
                )
              ],
            )),
        AppPaddings.appBarPadding);
  }

  Future<void> deleteGroupDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(GroupTextUtil.deleteGroupConfirmText),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(GroupTextUtil.deleteGroupWarningText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(GroupTextUtil.cancelText),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(GroupTextUtil.deleteText),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Widget miniHeadings(String name, bool isInMiddle) {
    return rowView(
        RowModel(
            text: name,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: false),
        EdgeInsets.symmetric(vertical: 16, horizontal: isInMiddle ? 10 : 0));
  }

  PersonMin person(String name, BuildContext context) {
    TherapistGroupController controller = Get.find();
    return PersonMin(
        padding: AppPaddings.tGroupPersonPadding,
        borderColor: AppColors.cornFlowerBlue,
        onTap: () {
          deleteParticipantDialog(context, name, controller);
        },
        row: RowModel(
            text: name,
            leadingIcon: CustomCircleAvatar(
                big: false,
                imagePath: DemoInformation.imagePath,
                shadow: false),
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: true,
            trailingIcon: IconUtility.deleteIcon));
  }

  Future<String?> deleteParticipantDialog(
      BuildContext context, String name, TherapistGroupController controller) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(name + GroupTextUtil.deleteParticipantText),
        // content: const Text(
        //     'Gruptan cikaril'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text(GroupTextUtil.cancelText),
          ),
          TextButton(
            onPressed: () {
              //participant silinecek

              Get.back();
            },
            child: Text(GroupTextUtil.deleteText),
          ),
        ],
      ),
    );
  }
}
