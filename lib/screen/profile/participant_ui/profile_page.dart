import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/profile/participant_ui/profile_setting_page.dart';
import '../../group/component/group.dart';
import '../../group/component/row_view.dart';
import '../component/container/meth_sem_short_cont.dart';
import '../models/group_model.dart';
import '../utility/profile_page_utility.dart';

class ParticipantProfilePage extends StatelessWidget {
  ParticipantProfilePage({super.key,});
  String imagePath = 'assets/images/f1.jpg';
  String nameSurname = 'Emily Jordan';
  String birthOfDate = '09/07/1995';
  GroupModelInProfilePage groupInformation = GroupModelInProfilePage(
      groupName: 'Anoreksiya',
      mainTherapistName: 'Kerem Engin',
      methodTitles: ['Başlık 1', 'Başlık 2', 'Başlık 3', 'Başlık 4'],
      secondTherapistName: 'Simay Selli',
      therapyTime: 'Her salı, 20.00');
  List<SeminarModelInProfilePage> lastWatchedSeminars = [
    SeminarModelInProfilePage(therapistName: 'Kerem Engin', seminarTitle: 'Seminer 1'),
    SeminarModelInProfilePage(therapistName: 'Mustafa Engin', seminarTitle: 'Seminer 2'),
    SeminarModelInProfilePage(therapistName: 'Mert Engin', seminarTitle: 'Seminer 3')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          ProfilePageUtility.backgroundOfThePage(false),
          ProfilePageUtility.positionedIconButton(Icons.settings_outlined,() => Get.to(() => ParticipantProfileSettingPage()),40,20),
          ProfilePageUtility.profilePagePersonImage(imagePath),
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
      padding: const EdgeInsets.only(left: 5, bottom: 10),
      child: GroupClass(
        height: 127,
        width: 300,
        borderColor: AppColors.cornFlowerBlue,
        heading: groupInformation.groupName,
        onTap: () {}, // navigate to group page
        row1: ProfilePageUtility.therapistRow(
            'Ana psikolog: ', groupInformation.mainTherapistName),
        row2: ProfilePageUtility.therapistRow(
            'Yardımcı Psikolog: ', groupInformation.secondTherapistName),
        row3: ProfilePageUtility.normalTextRow(
            groupInformation.therapyTime,
            Icons.alarm_outlined,
            AppTextStyles.normalTextStyle('medium', false)),
      ),
    );
  }

  Positioned nameAndBirthDateColumn() {
    return Positioned(
      top: 270,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (window.physicalSize.width - 140) / 2),
        child: Column(
          children: [
            Text(
              nameSurname,
              style: AppTextStyles.normalTextStyle('big', false),
            ),
            Text(birthOfDate,
                style: AppTextStyles.normalTextStyle('medium', false)),
          ],
        ),
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
              ? groupInformation.methodTitles.length
              : lastWatchedSeminars.length,
          itemBuilder: (context, index) {
            return MethodAndSeminarShortInfoContainer(
              row1Text: isMethod
                  ? groupInformation.mainTherapistName
                  : lastWatchedSeminars[index].therapistName,
              row2Text: isMethod
                  ? groupInformation.methodTitles[index]
                  : lastWatchedSeminars[index].seminarTitle,
              buttonText: isMethod ? 'Tekrar oku' : 'Tekrar izle',
              isSecondRowMethod: isMethod,
            );
          }),
    );
  }
}
