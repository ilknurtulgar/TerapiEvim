import 'package:flutter/material.dart';
import '../../util/base_model.dart';
import '../../util/base_utility.dart';
import '../../util/text_utility.dart';
import '../group/group.dart';
import 'container/two_row_short_container.dart';

class ProfilePageListView extends StatelessWidget {
  const ProfilePageListView(
      {super.key,
      required this.isForParticipant,
      required this.isForMethod,
      this.firstRowTextList,
      this.mainTherapistName,
      required this.secondRowTextList,
      this.groupNameList});
  final bool isForParticipant;
  final bool isForMethod;
  final List<String>? firstRowTextList;
  final String? mainTherapistName;
  final List<String> secondRowTextList;
  final List<String>? groupNameList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtil.doubleNormalValueHeight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: secondRowTextList.length,
          itemBuilder: ((context, index) {
            return groupNameList == null
                ? methodSeminarContainer(index)
                : groupContainer(index);
          })),
    );
  }

  Padding groupContainer(int index) {
    return Padding(
      padding: AppPaddings.smallPadding(3),
      child: GroupClass(
        width: SizeUtil.hugeValueWidth,
        isBorderPurple: true,
        heading: groupNameList![index],
        onTap: () {/*gruba git fonksiyonu*/},
        row1: UiBaseModel.doubleTextRow(
            TherapistProfileTextUtil.advisor, firstRowTextList![index], true),
        row2: UiBaseModel.normalTextRow(
            secondRowTextList[index],
            IconUtility.clockIcon.icon!,
            AppTextStyles.normalTextStyle('medium', false)),
      ),
    );
  }

  TwoRowShortContainer methodSeminarContainer(int index) {
    return TwoRowShortContainer(
      row1Text: isForParticipant && isForMethod
          ? mainTherapistName!
          : firstRowTextList![index], // grup: depresyon grubu yazınca overflow
      row2Text: secondRowTextList[index],
      firstIconData: isForParticipant
          ? IconUtility.personIcon.icon! //Icons.person_outline
          : isForMethod
              ? IconUtility.groupsIcon.icon!
              : IconUtility.windowsIcon.icon!,
      secondIconData: isForMethod
          ? IconUtility.fileIcon.icon!
          : isForParticipant
              ? IconUtility.windowsIcon.icon!
              : IconUtility.clockIcon.icon!,
      purpose: isForMethod ? 'method' : 'seminar',
      isThereButton: true,
      buttonText: isForParticipant
          ? isForMethod
              ? ParticipantProfileTextUtil.readAgain
              : ParticipantProfileTextUtil.watchAgain
          : isForMethod
              ? TherapistProfileTextUtil.view
              : TherapistProfileTextUtil.watch,
    );
  }
}
