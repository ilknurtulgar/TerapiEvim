import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/profile/container/two_row_short_container.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import '../../../core/base/component/group/group.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/home/custom_container.dart';
import '../../../core/base/models/container_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../participant/profile/profile_setting_page.dart';
import '../../participant/profile/util/profile_page_utility.dart';
class TherapistProfilePage extends StatelessWidget {
  const TherapistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(238, 227, 255, 1),
        body: SingleChildScrollView(
          child: 
             Stack(
              children: [
                ProfilePageUtility.backgroundOfThePage(),
                ProfilePageUtility.profilePagePersonImage(DemoInformation.imagePath),
                ProfilePageUtility.positionedIconButton(Icons.settings_outlined,() => Get.to(ParticipantProfileSettingPage()),50,10),
                Padding(
                  padding: const EdgeInsets.only(left: 24,top: 275),
                  child: Column(
                    children: [
                        const  Padding(
                              padding: EdgeInsets.only(right: 24),
                              child: Center(
                                child: Text(
                                 DemoInformation.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w400, fontSize: 31),
                                ),
                              ),
                            ),
                  const SizedBox(height: 20,),
                  positionedAboutMeColumn(),
                  positionedBoldMainTitleRow(
                      TherapistProfileTextUtil.myGroups, Icons.group_outlined, 360),
                  groupListView(),
                  positionedBoldMainTitleRow(
                      TherapistProfileTextUtil.methods, Icons.description_outlined, 520),
                  methodAndSeminarListView(true),
                  positionedBoldMainTitleRow(
                      TherapistProfileTextUtil.seminars, Icons.desktop_windows_outlined, 680),
                  methodAndSeminarListView(false),
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

  Widget methodAndSeminarListView(bool isMethod) {
    return SizedBox(
      height: 125,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: DemoInformation.therapyDates.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TwoRowShortContainer(
                row1Text: isMethod
                    ? 'Depresyon Grubu $index'
                    : 'Seminer $index', // grup: depresyon grubu yazınca overflow
                row2Text:
                    isMethod ? 'Kendini Bil $index' : DemoInformation.therapyDates[index],
                firstIconData: isMethod
                    ? Icons.group_outlined
                    : Icons.desktop_windows_outlined,
                secondIconData: isMethod
                    ? Icons.description_outlined
                    : Icons.alarm_outlined,
                purpose: isMethod ? 'method' : 'seminar',
                isThereButton: true,
                buttonText: isMethod ? TherapistProfileTextUtil.view : TherapistProfileTextUtil.watch,
              ),
            );
          })),
    );
  }

  Widget groupListView() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: DemoInformation.therapyDates.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GroupClass(
                height: 120,
                width: 320,
                borderColor: AppColors.cornFlowerBlue,
                heading: 'Depresyon ${index + 1}', // geçiçi olarak verdim
                onTap: () {},
                row1: ProfilePageUtility.doubleTextRow(
                    TherapistProfileTextUtil.advisor, 'Yeşim Ç.', true),
                row2: ProfilePageUtility.normalTextRow(
                    DemoInformation.therapyDates[index],
                    Icons.alarm_outlined,
                    const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 11)),
              ),
            );
          })),
    );
  }

  Widget positionedBoldMainTitleRow(
      String title, IconData iconData, double otherTopValue) {
    return rowView(
        ProfilePageUtility.boldMainTitleRow(title, iconData, () {
          /* nav func */
        }),
        EdgeInsets.zero);
  }

  Widget positionedAboutMeColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TherapistProfileTextUtil.aboutMe,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const SizedBox(
          height: 10,
        ),
        aboutMeContainer(),
      ],
    );
  }

  Padding aboutMeContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CustomContainer(
        containerModel: ContainerModel(
          width: 341,
          borderRadius: 8,
          backgroundColor: Colors.white,
        ),
        isThereCardModel: false,
        widget: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(DemoInformation.aboutMeController.text,style: AppTextStyles.normalTextStyle('medium', false),),
        ),
      ),
    );
  }
}
