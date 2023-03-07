import 'package:flutter/material.dart';
import '../../../../screen/participant/profile/util/profile_page_utility.dart';
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
      height: 130,
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

  GroupClass groupContainer(int index) {
    return GroupClass(
      height: 120,
      width: 320,
      borderColor: AppColors.cornFlowerBlue,
      heading: groupNameList![index],
      onTap: () {},
      row1: ProfilePageUtility.doubleTextRow(TherapistProfileTextUtil.advisor, firstRowTextList![index], true),
      row2: ProfilePageUtility.normalTextRow(secondRowTextList[index],Icons.alarm_outlined,AppTextStyles.normalTextStyle('medium',false)),
    );
  }

  TwoRowShortContainer methodSeminarContainer(int index) {
    return TwoRowShortContainer(
            row1Text: isForParticipant && isForMethod
                ? mainTherapistName!
                : firstRowTextList![index], // grup: depresyon grubu yazınca overflow
            row2Text: secondRowTextList[index],
            firstIconData: isForParticipant
                ? Icons.person_outline
                : isForMethod
                    ? Icons.group_outlined
                    : Icons.desktop_windows_outlined,
            secondIconData: isForMethod
                ? Icons.description_outlined
                : isForParticipant
                    ? Icons.desktop_windows_outlined
                    : Icons.alarm_outlined,
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
