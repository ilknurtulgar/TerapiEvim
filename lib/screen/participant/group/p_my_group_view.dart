import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/message/p_message_view.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/t_profile_about_view.dart';
import '../../../controller/participant/group/p_group_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/participant_container.dart';
import '../../../core/base/ui_models/card_model.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';

class PMyGroupView extends StatelessWidget {
  const PMyGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PGroupController>(
      getController: PGroupController(),
      onModelReady: (model) {
        //seansa katilmali
      },
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: GroupTextUtil.myGroupText),
        body: SafeArea(
          child: ListView(
            padding: AppPaddings.pagePadding,
            children: [
              CustomHeading(
                  isalignmentstart: true,
                  text: GroupTextUtil.upcomingMeetingText),
              ActivityBox(
                  rightButtonTap: () {},
                  istwobutton: false,
                  buttonText: GroupTextUtil.joinText,
                  isactivity: false,
                  containerModel: AppContainers.containerButton(false),
                  arowModel: rows(
                      DemoInformation.therapistName, RowType.therapist, false),
                  ayrowwModel: rows(DemoInformation.therapistName,
                      RowType.secTherapist, false),
                  clockModel:
                      rows(DemoInformation.therapistName, RowType.date, false)),
              CustomHeading(
                text: GroupTextUtil.groupsInformationText,
                isalignmentstart: true,
              ),
              therapist(
                  rows(DemoInformation.therapistName, RowType.therapist, true),
                  () {
                context.push(const TProfileView(isSecTherapist: false));
              }),
              therapist(UiBaseModel.messageToTherapist,
                  () => context.push(PMessageView())),
              therapist(
                  rows(DemoInformation.therapistName2, RowType.secTherapist,
                      true), () {
                context.push(const TProfileView(isSecTherapist: true));
              }),
              CustomHeading(
                text: GroupTextUtil
                    .participantsText, //buraya katilmiclarin kac kisi oldugu bilgisi gelecek
                isalignmentstart: true,
              ),
              participants(),
            ],
          ),
        ),
      ),
    );
  }

  RowModel rows(String name, RowType type, bool isGroupInformation) {
    String text = type == RowType.therapist
        ? GroupTextUtil.therapistTwoDot
        : type == RowType.secTherapist
            ? GroupTextUtil.secondTherapistText
            : "";

    return RowModel(
      isAlignmentBetween: isGroupInformation,
      leadingIcon:
          type == RowType.date ? IconUtility.clockIcon : IconUtility.personIcon,
      text: text,
      textStyle: AppTextStyles.groupTextStyle(false),
      text2: name,
      textStyle2: AppTextStyles.groupTextStyle(true),
    );
  }

  PersonMin therapist(RowModel row, Function() fun) {
    return PersonMin(
      onTap: fun,
      row: row,
      isBorderPurple: true,
    );
  }

  ListView participants() {
    //participant listesi gelecek
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DemoInformation.tmpParticipantNumber,
      itemBuilder: ((context, index) => participantContainer(
          CardModel(
              imagePath: DemoInformation.imagePath, title: "Aleyna Tilki"),
          SizeUtil.normalValueHeight)),
    );
  }
}

enum RowType { therapist, secTherapist, date }
