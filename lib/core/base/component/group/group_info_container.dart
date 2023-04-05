import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
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
            child: insideTheContainer(context),
          ),
        ),
      ),
    );
  }

  Column insideTheContainer(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: paddedText(groupName,AppPaddings.componentOnlyPadding(2),AppTextStyles.groupTextStyle(false))),
        therapistColumn(mainTherapist, GroupTextUtil.gruopTherapist, () {/* ana psikolog sayfasına gitme fonksiyonu */},context),
        therapistColumn(secondTherapist, GroupTextUtil.groupsecTherapist, () {/* yardımcı psikolog sayfasına gitme fonksiyonu */},context),
        Text(GroupTextUtil.participantNumber + numberOfParticipant.toString(),style: AppTextStyles.groupTextStyle(true)),
        paddedText(GroupTextUtil.sessionNumber + numberOfSession.toString(),AppPaddings.componentPadding,AppTextStyles.groupTextStyle(true)),
        joinButton(),
      ],
    );
  }

  Align joinButton() {
    return Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
            textColor: Colors.white,
            container: AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
            onTap: () {},
            text: GroupTextUtil.join,
          ));
  }

  Padding paddedText(String text,EdgeInsets padding,TextStyle textStyle) {
    return Padding(
      padding: padding,
      child: Text(text,style: textStyle,),
    );
  }

  Column therapistColumn(
    CardModel therapist,
    String text,
    Function() func,
    BuildContext context
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
                    width: context.width1 < 338
                        ? SizeUtil.mediumValueWidth-5
                        : SizeUtil.largeValueWidth,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
