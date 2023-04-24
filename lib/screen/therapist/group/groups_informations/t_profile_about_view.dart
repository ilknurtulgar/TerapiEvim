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
import '../../../../model/therapist/group/t_group_model.dart';
import '../../../participant/profile/util/p_profile_view_utility.dart';

class TProfileView extends StatelessWidget {
  const TProfileView(
      {super.key, required this.isSecTherapist, required this.groupId});

  final bool isSecTherapist;
  final String groupId;

  @override
  Widget build(BuildContext context) {
    List<RowModel> groups = [
      DemoInformation.grup1,
      DemoInformation.grup2,
      DemoInformation.grup1,
      DemoInformation.grup2
    ];
    return BaseView<TAboutTherapistController>(
      onModelReady: (controller) {
        controller.setContext(context);
        controller.setGroupId(groupId);
      },
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
                          heading(controller.tModel?.therapistName ?? "Null"),
                          aboutMe(controller.tModel?.aboutTherapist ?? "null",
                              context),
                          isSecTherapist
                              ? const SizedBox.shrink()
                              : activity(UiBaseModel.basetmeMetotlari(), () {
                                  //buradan terapistin basetme metodlarina gitmesi gerekiyor
                                }),
                          activity(UiBaseModel.seminerleri(), () {
                            //buradan terapistin seminerlerine gitmesi gerekiyor
                          }),
                          isSecTherapist
                              ? otherGroups(controller)
                              : const SizedBox.shrink()
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 87,
                  child: CustomCircleAvatar(
                      imagePath: controller.tModel?.therapistImageUrl ?? "",
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

Widget otherGroups(TAboutTherapistController controller) {
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
            itemCount: controller.tModel?.listOfHelpingGroups?.length ?? 0,
            itemBuilder: (context, index) {
              TGroupModel group =
                  controller.tModel!.listOfHelpingGroups![index];
              return activity(
                  RowModel(
                    text: group.name ?? "null",
                    textStyle: AppTextStyles.groupTextStyle(false),
                    isAlignmentBetween: false,
                    leadingIcon: IconUtility.groupsIcon,
                  ),
                  () {});
            })
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
