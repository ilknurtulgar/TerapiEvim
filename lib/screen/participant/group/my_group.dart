import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/participant_container.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/screen/participant/group/group_out.dart';
import 'package:terapievim/screen/participant/group/util/group_screen_utility.dart';
import '../../../core/base/component/group/row_view.dart';
import 'util/lock_screen_utility.dart';
import 'util/text_util.dart';

class MyGroup extends StatelessWidget {
  const MyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    RowModel appBar = RowModel(
        text: GroupTexts.myGroupText,
        textStyle: AppTextStyles.heading(false),
        trailingIcon: const GroupOut(),
        isAlignmentBetween: true);
    //buradaki tum modeller geecici

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              rowView(appBar, GroupPaddings.appbarPadding),
              CustomHeading(
                  isalignmentstart: true, text: GroupTexts.yaklasanToplanti),
              ActivityBox(
                  istwobutton: false,
                  buttonText: "Katıl",
                  isactivity: true,
                  containerModel: AppContainers.containerButton(false),
                  arowModel: DemoInformation.row,
                  ayrowwModel: DemoInformation.row,
                  clockModel: DemoInformation.row),
              CustomHeading(
                text: GroupTexts.grupBilgiler,
                isalignmentstart: true,
              ),
              therapist(DemoInformation.row),
              therapist(DemoInformation.row2),
              CustomHeading(
                text: GroupTexts.katilimcilar,
                isalignmentstart: true,
              ),
              participants(DemoInformation.person),
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
    var tmpParticipant = participantContainer(
        CardModel(imagePath: DemoInformation.imagePath, title: "Aleyna Tilki"),
        52,
        342);
    int tmpParticipantNumber = 5;
    //gecici katilimci modeli
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: Paddings.participantsPadding,
      shrinkWrap: true,
      itemCount: tmpParticipantNumber,
      itemBuilder: ((context, index) => tmpParticipant),
    );
  }
}
