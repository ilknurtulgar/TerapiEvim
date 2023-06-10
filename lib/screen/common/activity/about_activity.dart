import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/product/widget/common/empty_sized_box_text.dart';
import 'package:terapievim/screen/participant/profile/util/p_profile_view_utility.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/t_profile_about_view.dart';
import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/util/base_model.dart';

class AboutActivityView extends StatelessWidget {
  const AboutActivityView({super.key, required this.isService});
  final bool isService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isService == false ? MyAppBar(title: "Aktivite Detayları") : null,
      body: isService
          ? SingleChildScrollView(
              child: Stack(
                children: [
                  PProfileViewUtility.backgroundOfTheView(),
                  Positioned(
                      top: 40, child: backButton(context, () => context.pop())),
                  Padding(
                    padding: AppPaddings.pagePadding,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 190,
                        ),
                        heading(DemoInformation.nameSurname),
                        aboutMe(DemoInformation.aboutmeaperson, context),
                        activity(
                            UiBaseModel.aboutrowmodel(
                                DemoInformation.aboutActivtyName,
                                IconUtility.activityIcon),
                            () {}),
                        aboutActivityNameBox(),
                        activity(
                            UiBaseModel.aboutrowmodel(ActivityTextUtil.seminars,
                                IconUtility.activityIcon),
                            () {}),
                        activity(
                            UiBaseModel.aboutrowmodel(
                                DemoInformation.clockabomeactivty,
                                IconUtility.clockIcon),
                            () {}),
                        sizedBox()
                      ],
                    ),
                  ),
                  positionedCircle(),
                ],
              ),
            )
          : EmptySizedBoxText(),
    );
  }

  Positioned positionedCircle() {
    return const Positioned(
      top: 70,
      left: 50,
      right: 50,
      child: CustomCircleAvatar(
          imagePath: DemoInformation.japonkadin, big: true, shadow: true),
    );
  }

  Padding aboutActivityNameBox() {
    return const Padding(
      padding: AppPaddings.rowViewProfilePadding,
      child: PurpleTextContainer(text: DemoInformation.aboutmeabactivity),
    );
  }
}
