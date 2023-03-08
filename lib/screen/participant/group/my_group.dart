import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/participant_container.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/group/group_out.dart';
import 'package:terapievim/screen/therapist/group/therapist_about.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/util/text_utility.dart';

class MyGroup extends StatelessWidget {
  const MyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    RowModel appBar = RowModel(
        text: GroupTextUtil.myGroupText,
        textStyle: AppTextStyles.heading(false),
        trailingIcon: const GroupOut(),
        isAlignmentBetween: true);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              rowView(appBar, AppPaddings.appBarPadding),
              CustomHeading(
                  isalignmentstart: true,
                  text: GroupTextUtil.upcomingMeetingText),
              ActivityBox(
                  istwobutton: false,
                  buttonText: "Katıl",
                  isactivity: true,
                  containerModel: AppContainers.containerButton(false),
                  arowModel: DemoInformation.row,
                  ayrowwModel: DemoInformation.row,
                  clockModel: DemoInformation.row),
              CustomHeading(
                text: GroupTextUtil.groupsInformationText,
                isalignmentstart: true,
              ),
              therapist(DemoInformation.row, () {
                context.push(TherapistProfile(isSecTherapist: false));
              }),
              therapist(DemoInformation.row2, () {
                context.push(TherapistProfile(isSecTherapist: true));
              }),
              CustomHeading(
                text: GroupTextUtil.participantsText,
                isalignmentstart: true,
              ),
              participants(DemoInformation.person),
            ],
          ),
        ),
      ),
    );
  }

  PersonMin therapist(RowModel row, Function() fun) {
    return PersonMin(
      onTap: fun,
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
      padding: AppPaddings.participantsPadding,
      shrinkWrap: true,
      itemCount: tmpParticipantNumber,
      itemBuilder: ((context, index) => tmpParticipant),
    );
  }
}
