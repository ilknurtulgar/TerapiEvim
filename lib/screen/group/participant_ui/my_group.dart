import 'package:flutter/material.dart';
import 'package:terapievim/screen/group/component/participant_container.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';
import 'package:terapievim/screen/group/component/group_box.dart';
import 'package:terapievim/screen/group/component/heading.dart';
import 'package:terapievim/screen/group/component/person.dart';

import 'package:terapievim/screen/profile/component/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/screen/group/participant_ui/group_out.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';
import 'package:terapievim/screen/group/util/lockScreenutility.dart';
import 'package:terapievim/screen/group/util/text_util.dart';

class MyGroup extends StatelessWidget {
  const MyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    //buradaki tum modeller geecici
    String imagePath = "assets/images/doctorfotosu.jpeg";
    RowModel row = RowModel(
      isAlignmentBetween: true,
      leadingIcon: IconUtility.personIcon,
      text: "Grup Terapisti : ",
      textStyle: AppTextStyles.GroupTextStyle(false),
      text2: "Simay Odabasi",
      textStyle2: AppTextStyles.GroupTextStyle(true),
    );
    RowModel row2 = RowModel(
      isAlignmentBetween: true,
      leadingIcon: IconUtility.personIcon,
      text: "Yardimci Psikolog: ",
      textStyle: AppTextStyles.GroupTextStyle(false),
      text2: "Ozlem Ulusan",
      textStyle2: AppTextStyles.GroupTextStyle(true),
    );
    RowModel person = RowModel(
        isAlignmentBetween: true,
        leadingIcon:
            CustomCircleAvatar(big: false, shadow: false, imagePath: imagePath),
        text: "Aleyna Tilki",
        textStyle: AppTextStyles.GroupTextStyle(true));

    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appbar(),
              CustomHeading(text: GroupTexts.yaklasanToplanti),
              ActivityBox(
                  isactivity: true,
                  containerModel: containerButton,
                  arowModel: row,
                  ayrowwModel: row,
                  clockModel: row),
              CustomHeading(text: GroupTexts.grupBilgiler),
              therapist(row),
              therapist(row2),
              CustomHeading(text: GroupTexts.katilimcilar),
              participants(person),
            ],
          ),
        ),
      ),
    );
  }

  PersonMin therapist(RowModel row) {
    return PersonMin(
      onTap: () {},
      row: row,
      borderColor: AppColors.cornFlowerBlue,
    );
  }

  ListView participants(RowModel person) {
    String imagePath = "assets/images/doctorfotosu.jpeg";
    var tmpParticipant = participantContainer(
        CardModel(imagePath: imagePath, title: "Aleyna Tilki"), 52, 342);
    int tmpParticipantNumber = 5;
    //gecici katilimci modeli
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: paddings.participantsPadding,
      shrinkWrap: true,
      itemCount: tmpParticipantNumber,
      itemBuilder: ((context, index) => tmpParticipant),
    );
  }

  Widget appbar() {
    return Padding(
      padding: GroupPaddings.appbarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 20,
          ),
          Heading(headingText: GroupTexts.myGroupText),
          const GroupOut(),
        ],
      ),
    );
  }
}
