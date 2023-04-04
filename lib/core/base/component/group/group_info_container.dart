import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../screen/participant/video_call/util/utility.dart';
import '../buttons/custom_button.dart';
import 'participant_container.dart';
import '../../util/base_utility.dart';
import '../../ui_models/card_model.dart';

class GroupInformationContainer extends StatelessWidget {
  const GroupInformationContainer(
      {super.key,
      required this.groupName,
      required this.mainTherapist,
      required this.secondTherapist,
      required this.numberOfParticipant,
      required this.numberOfSession});
  final String groupName;
  final CardModel mainTherapist;
  final CardModel secondTherapist;
  final int numberOfParticipant;
  final int numberOfSession;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Material(
        elevation: 5,
        borderRadius: AppBorderRadius.notificationradius,
        child: Container(
          decoration: AppBoxDecoration.shadow,
          child: Padding(
            padding: AppPaddings.customContainerInsidePadding(3),
            child: insideTheContainer(),
          ),
        ),
      ),
    );
  }

  Column insideTheContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: paddedText(AppPaddings.componentOnlyPadding(2), groupName,
                AppTextStyles.groupTextStyle(false))),
        therapistColumn(mainTherapist, GroupTextUtil.gruopTherapist, () {
          /* ana psikolog sayfasına gitme fonksiyonu */
        }),
        therapistColumn(secondTherapist, GroupTextUtil.groupsecTherapist, () {
          /* yardımcı psikolog sayfasına gitme fonksiyonu */
        }),
        Text(GroupTextUtil.participantNumber + numberOfParticipant.toString(),
            style: AppTextStyles.groupTextStyle(true)),
        paddedText(
            AppPaddings.componentPadding,
            GroupTextUtil.sessionNumber + numberOfSession.toString(),
            AppTextStyles.groupTextStyle(true)),
        Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              textColor: Colors.white,
              container:
                  AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
              onTap: () {},
              text: GroupTextUtil.join,
            )),
      ],
    );
  }

  Padding paddedText(EdgeInsets padding, String text, TextStyle textStyle) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }

  Column therapistColumn(
    CardModel therapist,
    String text,
    Function() func,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppTextStyles.groupTextStyle(true)),
        Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: func,
                  child: participantContainer(
                    therapist,
                    SizeUtil.normalValueHeight,
                    width: PixelScreen().logicalWidth < 300
                        ? SizeUtil.mediumValueWidth
                        : SizeUtil.largeValueWidth,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
