import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/profile/profile_setting_page.dart';
import '../../../core/base/component/group/group.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/profile/container/two_row_short_container.dart';
import 'util/profile_page_utility.dart';

class ParticipantProfilePage extends StatelessWidget {
  const ParticipantProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          ProfilePageUtility.backgroundOfThePage(),
          ProfilePageUtility.positionedIconButton(Icons.settings_outlined,() => Get.to(() => ParticipantProfileSettingPage()), 40, 20),
          ProfilePageUtility.profilePagePersonImage(DemoInformation.profileImagePath),
          Padding(
            padding: const EdgeInsets.only(top: 270,left: 24),
            child: Column(
              children: [
                nameAndBirthDateColumn(),
                const SizedBox(height: 10,),
                participantGroupColumn(),
                boldMainTitleRowView(true),
                listviewForMethodsAndSeminars(true),
                boldMainTitleRowView(false),
                listviewForMethodsAndSeminars(false),
                const SizedBox(height: 15,),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget boldMainTitleRowView(bool isMethodMainTitle) {// top: isMethodMainTitle ? 505 : 665,
    return rowView(
        ProfilePageUtility.boldMainTitleRow(
            isMethodMainTitle
                ? ParticipantProfileTextUtil.lastRead
                : ParticipantProfileTextUtil.joinedSeminars,
            isMethodMainTitle
                ? Icons.alarm_outlined
                : Icons.desktop_windows_outlined, () {
          /* nav func */
        }),
         EdgeInsets.zero);
  }

  Column participantGroupColumn() {// top 330
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowView(
            ProfilePageUtility.normalTextRow(
                ParticipantProfileTextUtil.myActiveGroup,
                Icons.group_outlined,
                const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
             EdgeInsets.zero),
        const SizedBox(height: 10,),
        participantGroupContainer(),
      ],
    );
  }

  Widget participantGroupContainer() {
    return GroupClass(
      height: 138,
      width: 350,
      borderColor: AppColors.cornFlowerBlue,
      heading: DemoInformation.groupInformation.groupName,
      onTap: () {}, // navigate to group page
      row1: ProfilePageUtility.doubleTextRow(
          ParticipantProfileTextUtil.mainTherpist, DemoInformation.groupInformation.mainTherapistName, true),
      row2: ProfilePageUtility.doubleTextRow(
          ParticipantProfileTextUtil.advisor, DemoInformation.groupInformation.secondTherapistName, true),
      row3: ProfilePageUtility.normalTextRow(
          DemoInformation.groupInformation.therapyTime,
          Icons.alarm_outlined,
          AppTextStyles.normalTextStyle('medium', false)),
    );
  }

  Padding nameAndBirthDateColumn() { // top 270 left 137
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DemoInformation.nameSurname,
            style: AppTextStyles.normalTextStyle('big', false),
          ),
          Text(DemoInformation.birthOfDate,
              style: AppTextStyles.normalTextStyle('medium', false)),
        ],
      ),
    );
  }

  Widget listviewForMethodsAndSeminars(bool isMethod) { // Positioned(
      //top: isMethod ? 550 : 710,
      //left: 30,
      //right: 10,
      //height: 130,
    return SizedBox(
      height: 130 ,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: isMethod
              ? DemoInformation.groupInformation.methodTitles.length
              : DemoInformation.lastWatchedSeminars.length,
          itemBuilder: (context, index) {
            return TwoRowShortContainer(
              row1Text: isMethod
                  ? DemoInformation.groupInformation.mainTherapistName
                  : DemoInformation.lastWatchedSeminars[index].therapistName,
              row2Text: isMethod
                  ? DemoInformation.groupInformation.methodTitles[index]
                  : DemoInformation.lastWatchedSeminars[index].seminarTitle,
              firstIconData: Icons.person_outline,
              secondIconData: isMethod ? Icons.description_outlined : Icons.desktop_windows_outlined,
              buttonText: isMethod ? ParticipantProfileTextUtil.readAgain : ParticipantProfileTextUtil.watchAgain,
              purpose: isMethod ? 'method' : 'seminar',
              isThereButton: true,
            );
          }),
    );
  }
}
