import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
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
import '../../../core/managers/converter/date_time_manager.dart';

class PMyGroupView extends StatelessWidget {
  const PMyGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PGroupController>(
      getController: PGroupController(),
      onModelReady: (controller) {
        controller.setContext(context);
      },
      onPageBuilder: (context, controller) => SafeArea(
        top: false,
        child: Scaffold(
          appBar: MyAppBar(title: GroupTextUtil.myGroupText),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.send),
            onPressed: () {
              controller.joinIsolatedCall();
            },
          ),
          body: ListView(
            padding: AppPaddings.pagePadding,
            children: [
              CustomHeading(
                  isalignmentstart: true,
                  text: GroupTextUtil.upcomingMeetingText),
              Obx(
                () => ActivityBox(
                    rightButtonTap: () {
                      controller.joinVideoCall();
                    },
                    istwobutton: false,
                    buttonText: GroupTextUtil.joinText,
                    isactivity: false,
                    containerModel: AppContainers.containerButton(false),
                    arowModel: rows(
                        controller.tGroupSession.value?.therapistName ??
                            "null",
                        RowType.therapist,
                        false),
                    ayrowwModel: rows(
                        controller.tGroupSession.value?.therapistHelperName ??
                            "null",
                        RowType.secTherapist,
                        false),
                    clockModel: rows(
                        DateTimeManager.getFormattedDateFromFormattedString(
                            value: controller.tGroupSession.value?.dateTime
                                ?.toDate()
                                .toIso8601String()),
                        RowType.date,
                        false)),
              ),
              CustomHeading(
                text: GroupTextUtil.groupsInformationText,
                isalignmentstart: true,
              ),
              Obx(
                () => therapist(
                    rows(
                        controller.tGroupSession.value?.therapistName ??
                            "null",
                        RowType.therapist,
                        true), () {
                  context.push(TAboutProfileView(
                    isSecTherapist: false,
                    groupId: controller.currentGroupId,
                  ));
                }),
              ),
              therapist(UiBaseModel.messageToTherapist,
                  () => context.push(PMessageView())),
              Obx(
                () => therapist(
                    rows(
                        controller.tGroupSession.value?.therapistHelperName ??
                            'null',
                        RowType.secTherapist,
                        true), () {
                  context.push(TAboutProfileView(
                    isSecTherapist: true,
                    groupId: controller.currentGroupId,
                  ));
                }),
              ),
              CustomHeading(
                text: GroupTextUtil.participantsText +
                    controller.participants.length.toString(),
                isalignmentstart: true,
              ),
              participants(controller),
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

  Widget participants(PGroupController controller) {
    //participant listesi gelecek
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.participants.length,
        itemBuilder: ((context, index) => participantContainer(
            CardModel(
                imagePath: controller.participants[index].imageUrl ?? "null",
                title: controller.participants[index].name ?? "null"),
            SizeUtil.normalValueHeight)),
      ),
    );
  }
}

enum RowType { therapist, secTherapist, date }
