import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import '../../../core/base/util/base_model.dart';

class TherapistProfile extends StatelessWidget {
  const TherapistProfile({super.key, required this.isSecTherapist});
  final bool isSecTherapist;

  @override
  Widget build(BuildContext context) {
    List<RowModel> groups = [
      DemoInformation.grup1,
      DemoInformation.grup2,
      DemoInformation.grup1,
      DemoInformation.grup2
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            textDirection: TextDirection.rtl,
            fit: StackFit.loose,
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  whiteBackground(context),
                  heading(DemoInformation.therapistName2),
                  aboutMe(DemoInformation.aboutme),
                  isSecTherapist
                      ? const SizedBox.shrink()
                      : activity(UiBaseModel.basetmeMetotlari(), () {
                          //buraya fonksiyonlari ekelenecek
                          // print("basettin mi");
                        }),
                  activity(UiBaseModel.seminerleri(), () {
                    //print("seminermismis");
                  }),
                  activity(UiBaseModel.mesajGonder(), () {
                    // print("selam");
                  }),
                  isSecTherapist ? otherGroups(groups) : const SizedBox.shrink()
                ],
              ),
              Positioned(
                top: 87,
                child: CustomCircleAvatar(
                    imagePath: DemoInformation.imagePath,
                    big: true,
                    shadow: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget activity(RowModel row, Function() func) {
  return SeminarMin(
    onTap: func,
    row: row,
    isBorderPurple: true,
  );
}

Widget otherGroups(List<RowModel> groups) {
  return Padding(
    padding: AppPaddings.tGroupPersonPadding,
    child: Column(
      children: [
        CustomHeading(
            padding: AppPaddings.miniHeadingPadding(false),
            text: GroupTextUtil.secTherapistGroupsText,
            isalignmentstart: true),
        ListView.builder(
          shrinkWrap: true,
          itemCount: groups.length,
          itemBuilder: (context, index) => activity(groups[index], () => null),
        )
      ],
    ),
  );
}

Text heading(name) {
  return Text(
    name,
    textAlign: TextAlign.center,
    style: AppTextStyles.aboutMeTextStyle(true),
  );
}

Container aboutMe(String aboutme) {
  return Container(
    padding: AppPaddings.aboutmePadding,
    width: SizeUtil.largeValueWidth,
    child: Text(
      aboutme,
      textAlign: TextAlign.justify,
      style: AppTextStyles.aboutMeTextStyle(false),
    ),
  );
}

Container whiteBackground(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: SizeUtil.highValueHeight,
    color: AppColors.white,
    margin: AppPaddings.whitebackgroundmargin,
  );
}
