import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/custom_list_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/profile/models/group_model.dart';
import 'package:terapievim/screen/participant/profile/profile_setting_page.dart';
import '../../../core/base/component/group/group.dart';
import '../../../core/base/component/group/row_view.dart';
import 'util/profile_page_utility.dart';

class ParticipantProfilePage extends StatelessWidget {
  const ParticipantProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            ProfilePageUtility.backgroundOfThePage(),
            ProfilePageUtility.positionedIconButton(Icons.settings_outlined,() => context.push(ParticipantProfileSettingPage()), 40, 20),
            ProfilePageUtility.profilePagePersonImage(DemoInformation.profileImagePath),
            Padding(
              padding: AppPaddings.profilePageBigPadding(true),
              child: Column(
                children: [
                  nameAndBirthDateColumn(),
                  smallSizedBox(),
                  participantGroupColumn(),
                  smallSizedBox(),
                  ProfilePageUtility.boldMainTitleRowView(ParticipantProfileTextUtil.lastRead,'method', (){}),
                  ProfilePageListView(isForParticipant: true, isForMethod: true,mainTherapistName: DemoInformation.groupInformation.mainTherapistName,secondRowTextList: DemoInformation.groupInformation.methodTitles,),
                  ProfilePageUtility.boldMainTitleRowView(ParticipantProfileTextUtil.joinedSeminars,'seminar', (){}),
                  ProfilePageListView(isForParticipant: true, isForMethod: false,firstRowTextList:DemoInformation.lastWatchedSeminars.getSeminarsTherapistName(),secondRowTextList: DemoInformation.lastWatchedSeminars.getSeminarTitles()),
                  smallSizedBox(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Column participantGroupColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowView(ProfilePageUtility.normalTextRow(ParticipantProfileTextUtil.myActiveGroup,Icons.group_outlined,AppTextStyles.profileTextStyles(true,true)),EdgeInsets.zero),
        smallSizedBox(),
        participantGroupContainer(),
      ],
    );
  }

  Widget participantGroupContainer() {
    return GroupClass(
      height: SizeUtil.groupContainerHeight,
      width: SizeUtil.groupContainerWidth,
      borderColor: AppColors.cornFlowerBlue,
      heading: DemoInformation.groupInformation.groupName,
      onTap: () {}, // navigate to group page
      row1: ProfilePageUtility.doubleTextRow(ParticipantProfileTextUtil.mainTherpist,DemoInformation.groupInformation.mainTherapistName,true),
      row2: ProfilePageUtility.doubleTextRow(ParticipantProfileTextUtil.advisor,DemoInformation.groupInformation.secondTherapistName,true),
      row3: ProfilePageUtility.normalTextRow(DemoInformation.groupInformation.therapyTime,Icons.alarm_outlined,AppTextStyles.normalTextStyle('medium', false)),
    );
  }

  Padding nameAndBirthDateColumn() {
    return Padding(
      padding: AppPaddings.mediumPadding(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DemoInformation.nameSurname,style: AppTextStyles.normalTextStyle('big', false),),
          Text(DemoInformation.birthOfDate,style: AppTextStyles.normalTextStyle('medium', false)),
        ],
      ),
    );
  }
}

extension SeminarListExtension on List<SeminarModelInProfilePage> {
  List<String> getSeminarTitles(){
    int i=0;
    List<String> seminarTitles=[];
    for(i=0 ; i<length ; i++){
      seminarTitles.add(this[i].seminarTitle);
    }
    return seminarTitles;
  }

  List<String> getSeminarsTherapistName(){
    int i=0;
    List<String> therapistList=[];
    for(i=0 ; i<length ; i++){
      therapistList.add(this[i].therapistName);
    }
    return therapistList;
  }
}