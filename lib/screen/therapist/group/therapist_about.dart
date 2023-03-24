import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

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
                  Padding(
                    padding: AppPaddings.pagePadding,
                    child: Column(
                      children: [
                        heading(DemoInformation.therapistName2),
                        aboutMe(DemoInformation.aboutme, context),
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
                        isSecTherapist
                            ? otherGroups(groups)
                            : const SizedBox.shrink()
                      ],
                    ),
                  )
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
  return Padding(
    padding: AppPaddings.miniTopPadding,
    child: SeminarMin(
      onTap: func,
      row: row,
      isBorderPurple: false,
    ),
  );
}

Widget otherGroups(List<RowModel> groups) {
  return Padding(
    padding: AppPaddings.miniTopPadding,
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

Padding heading(name) {
  return Padding(
    padding: AppPaddings.headingTopPadding,
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: AppTextStyles.aboutMeTextStyle(true),
    ),
  );
}

Widget aboutMe(String aboutme, BuildContext context) {
  return SizedBox(
      width: Responsive.width(270, context),
      child: responsivenestext(aboutme, AppTextStyles.aboutMeTextStyle(false)));
}

Container whiteBackground(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: SizeUtil.highValueHeight,
    color: AppColors.white,
    child: IconButton(
      icon: IconUtility.back,
      onPressed: () {
        context.pop();
      },
    ),
  );
}
