import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/group/t_about_therapist.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../../core/base/component/activtiy/seminers.dart';
import '../../../../core/base/component/group/custom_heading.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../participant/profile/util/p_profile_view_utility.dart';

class TProfileView extends StatelessWidget {
  const TProfileView({super.key, required this.isSecTherapist});

  final bool isSecTherapist;

  @override
  Widget build(BuildContext context) {
    List<RowModel> groups = [
      DemoInformation.grup1,
      DemoInformation.grup2,
      DemoInformation.grup1,
      DemoInformation.grup2
    ];
    return BaseView<TAboutTherapistController>(
      getController: TAboutTherapistController(),
      onPageBuilder: (context, controller) => Scaffold(
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
                ),
                PProfileViewUtility.positionedIconButton(
                    IconUtility.back.icon!,
                    () => context.pop(),
                    SizeUtil.lowValueWidth,
                    Responsive.widthForBackIcon(context))
              ],
            ),
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
  );
}
