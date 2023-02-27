import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/profile/profile_setting_page.dart';
import '../../../core/base/component/group/group.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/profile/container/two_row_short_container.dart';
import 'models/group_model.dart';
import 'util/profile_page_utility.dart';

class ParticipantProfilePage extends StatelessWidget {
  ParticipantProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          ProfilePageUtility.backgroundOfThePage(),
          ProfilePageUtility.positionedIconButton(Icons.settings_outlined,() => Get.to(() => ParticipantProfileSettingPage()), 40, 20),
          ProfilePageUtility.profilePagePersonImage(DemoInformation.profileImagePath),
          nameAndBirthDateColumn(),
          participantGroupColumn(),
          positionedBoldMainTitleRow(true),
          listviewForMethodsAndSeminars(true),
          positionedBoldMainTitleRow(false),
          listviewForMethodsAndSeminars(false),
        ]),
      ),
    );
  }

  Positioned positionedBoldMainTitleRow(bool isMethodMainTitle) {
    return Positioned(
        top: isMethodMainTitle ? 505 : 665,
        child: rowView(
            ProfilePageUtility.boldMainTitleRow(
                isMethodMainTitle
                    ? 'En Son Incelediklerim'
                    : 'Katıldığım Seminerler',
                isMethodMainTitle
                    ? Icons.alarm_outlined
                    : Icons.desktop_windows_outlined, () {
              /* nav func */
            }),
            const EdgeInsets.only(left: 10, bottom: 5)));
  }

  Positioned participantGroupColumn() {
    return Positioned(
      top: 330,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rowView(
              ProfilePageUtility.normalTextRow(
                  'Aktif Grubum',
                  Icons.group_outlined,
                  const TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const EdgeInsets.only(right: 160, bottom: 10, left: 10)),
          participantGroupContainer(),
        ],
      ),
    );
  }

  Padding participantGroupContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 35, bottom: 10),
      child: GroupClass(
        height: 138,
        width: 350,
        borderColor: AppColors.cornFlowerBlue,
        heading: DemoInformation.groupInformation.groupName,
        onTap: () {}, // navigate to group page
        row1: ProfilePageUtility.doubleTextRow(
            'Ana psikolog: ', DemoInformation.groupInformation.mainTherapistName, true),
        row2: ProfilePageUtility.doubleTextRow(
            'Yardımcı Psikolog: ', DemoInformation.groupInformation.secondTherapistName, true),
        row3: ProfilePageUtility.normalTextRow(
            DemoInformation.groupInformation.therapyTime,
            Icons.alarm_outlined,
            AppTextStyles.normalTextStyle('medium', false)),
      ),
    );
  }

  Positioned nameAndBirthDateColumn() {
    return Positioned(
      top: 270,
      left: 137,
      child: Column(
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

  Positioned listviewForMethodsAndSeminars(bool isMethod) {
    return Positioned(
      top: isMethod ? 550 : 710,
      left: 30,
      right: 10,
      height: 130,
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
              buttonText: isMethod ? 'Tekrar oku' : 'Tekrar izle',
              purpose: isMethod ? 'method' : 'seminar',
              isThereButton: true,
            );
          }),
    );
  }
}
