import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/profile/custom_list_view.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../core/base/component/home/custom_container.dart';
import '../../../core/base/util/base_utility.dart';
import '../../participant/profile/profile_setting_page.dart';
import '../../participant/profile/util/profile_page_utility.dart';
class TherapistProfilePage extends StatelessWidget {
  const TherapistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueChalk,
        body: SingleChildScrollView(
          child: Stack(
              children: [
                ProfilePageUtility.backgroundOfThePage(),
                ProfilePageUtility.profilePagePersonImage(DemoInformation.imagePath),
                ProfilePageUtility.positionedIconButton(Icons.settings_outlined,() => Get.to(ParticipantProfileSettingPage()),50,10),
                Padding(
                  padding: const EdgeInsets.only(left: 24,top: 275),
                  child: Column(
                    children: [
                      therapistName(),
                      const SizedBox(height: 20,),
                      aboutMeColumn(),
                      ProfilePageUtility.boldMainTitleRowView(TherapistProfileTextUtil.myGroups,'group',(){}),
                      ProfilePageListView(isForParticipant: false, isForMethod: false, firstRowTextList: DemoInformation.advisorNames,secondRowTextList: DemoInformation.dates,groupNameList: DemoInformation.groupNameList,),
                      ProfilePageUtility.boldMainTitleRowView(TherapistProfileTextUtil.methods,'method',(){}),
                      ProfilePageListView(isForParticipant: false, isForMethod: true,firstRowTextList: DemoInformation.groupNameList,secondRowTextList: DemoInformation.methodNames),
                      ProfilePageUtility.boldMainTitleRowView(TherapistProfileTextUtil.seminars,'seminar',(){}),
                      ProfilePageListView(isForParticipant: false, isForMethod: false,firstRowTextList: DemoInformation.seminarNames,secondRowTextList: DemoInformation.dates,),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),     
              ],
            ),
          ),
        ),
    );
  }

  Padding therapistName() {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Center(
        child: Text(DemoInformation.name,style: AppTextStyles.aboutMeTextStyle(true),
      ),
     ),
    );
  }

  Widget aboutMeColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TherapistProfileTextUtil.aboutMe,style: AppTextStyles.profileTextStyles(false,true),),
        const SizedBox(height: 10,),
        aboutMeContainer(),
      ],
    );
  }

  Padding aboutMeContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CustomContainer(
        containerModel: AppContainers.classicWhiteContainer,
        isThereCardModel: false,
        widget: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(DemoInformation.aboutMeController.text,style: AppTextStyles.normalTextStyle('medium', false),),
        ),
      ),
    );
  }
}