import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/participant/group/util/lock_screen_utility.dart';
import 'package:terapievim/screen/therapist/group/therapist_about.dart';

import '../../../core/base/component/profile/image/custom_circle_avatar.dart';

class AboutActivityScreen extends StatelessWidget {
  const AboutActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  whiteBackground(context),
                  heading(DemoInformation.aboutmeaperson),
                  aboutMe(DemoInformation.aboutmeaperson),
                  activity(
                      aboutrowmodel("Grup Terapilerinin Etkisi",
                          IconUtility.activityIcon),
                      () => null),
                  const Padding(
                    padding: Paddings.rowViewProfilePadding,
                    child: PurpleTextContainer(
                        text: DemoInformation.aboutmeabactivity),
                  ),
                  activity(
                      aboutrowmodel("Seminerleri", IconUtility.activityIcon),
                      () => null),
                  activity(
                      aboutrowmodel(DemoInformation.clockabomeactivty,
                          IconUtility.clockIcon),
                      () => null),
                  sizedbox()
                ],
              ),
              const Positioned(
                top: 87,
                left: 50,
                right: 50,
                child: CustomCircleAvatar(
                    imagePath: DemoInformation.japonkadin,
                    big: true,
                    shadow: true),
              )
            ],
          ),
        ),
      ),
    );
  }

  RowModel aboutrowmodel(String headingtext, Icon leadingIcon) {
    return RowModel(
        text: headingtext,
        textStyle: AppTextStyles.groupTextStyle(false),
        leadingIcon: leadingIcon,
        isAlignmentBetween: false);
  }
}
