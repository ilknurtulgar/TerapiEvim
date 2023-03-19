import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../buttons/custom_button.dart';
import 'participant_container.dart';
import '../../util/base_utility.dart';
import '../../models/card_model.dart';

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
    return Material(
      elevation: 5,
      borderRadius: AppBorderRadius.notificationradius,
      child: Container(
        width: SizeUtil.generalWidth,
        decoration: AppBoxDecoration.shadow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: insideTheContainer(),
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
            child: paddedText(const EdgeInsets.symmetric(vertical: 15),
                groupName, AppTextStyles.groupTextStyle(false))),
        therapistRow(mainTherapist, GroupTextUtil.gruopTherapist, () {
          /* ana psikolog sayfasına gitme fonksiyonu */
        }, SizeUtil.mediumValueWidth),
        therapistRow(secondTherapist, GroupTextUtil.groupsecTherapist, () {
          /* yardımcı psikolog sayfasına gitme fonksiyonu */
        }, SizeUtil.participantContainerWidth),
        Text(GroupTextUtil.participantNumber + numberOfParticipant.toString(),
            style: AppTextStyles.groupTextStyle(true)),
        paddedText(
            const EdgeInsets.only(top: 20, bottom: 10),
            GroupTextUtil.sessionNumber + numberOfSession.toString(),
            AppTextStyles.groupTextStyle(true)),
        Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              textColor: Colors.white,
              container: AppContainers.purpleButtonContainer(null),
              onTap: () {},
              text: GroupTextUtil.join,
            )),
        smallSizedBox() // eski hali const SizedBox(height: 15,)
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

  Row therapistRow(
      CardModel therapist, String text, Function() func, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppTextStyles.groupTextStyle(true)),
        InkWell(
            onTap: func,
            child: participantContainer(
              therapist,
              SizeUtil.normalValueHeight,
              width: width,
            )),
      ],
    );
  }
}
