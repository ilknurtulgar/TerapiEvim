import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/filter_box.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/service/model/participant/group/participants.dart';
import 'package:terapievim/service/model/therapist_model.dart';

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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            heading(context),
            miniHeadings("Yaklasan Toplanti", false),
            meeting(),
            miniHeadings("Grubun Bilgileri", false),
            navMethod(DemoInformation.secTherapist, () {}),
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
                          text: "Katilimcilar",
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
            //dropdownlu component gelecek katilimcilar
            navMethod(DemoInformation.methods, () {}),
          ],
        ),
      ),
    );
  }

  ActivityBox meeting() {
    return ActivityBox(
        istwobutton: false,
        containerModel: AppContainers.containerButton(false),
        buttonText: "Baslat",
        arowModel: RowModel(
          leadingIcon: IconUtility.personIcon,
          isAlignmentBetween: false,
          text: "Yardimci Psikolog: ",
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

  Padding navMethod(RowModel row, Function func) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child:
          SeminarMin(borderColor: AppColors.meteorite, onTap: func(), row: row),
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
        const EdgeInsets.symmetric(vertical: 25, horizontal: 10));
  }

  Future<void> deleteGroupDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Grubu Silmek Istediginize Emin Misiniz? "),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Silinen gruplar geri getirilemez.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Vazgec"),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Sil'),
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
        padding: const EdgeInsets.only(top: 10),
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
        title:
            Text("$name kişisini gruptan cikarmak istediginize emin misiniz?"),
        // content: const Text(
        //     'Gruptan cikaril'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              //participant silinecek

              Get.back();
            },
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }
}
