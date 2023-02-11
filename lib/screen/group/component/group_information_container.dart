import 'package:flutter/material.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import 'participant_container.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/models/card_model.dart';

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
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 342,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
        Center(child: paddedText(const EdgeInsets.symmetric(vertical: 15),groupName, AppTextStyles.GroupTextStyle(false))),
        therapistRow(mainTherapist, 'Grup Terapisti: ', () {/* ana psikolog sayfasına gitme fonksiyonu */}, 192),
        therapistRow(secondTherapist, 'Yardımcı Psikolog: ', () {/* yardımcı psikolog sayfasına gitme fonksiyonu */}, 170),
        Text('Katılımcı Sayısı: $numberOfParticipant',style: AppTextStyles.GroupTextStyle(true)),
        paddedText(const EdgeInsets.only(top: 20, bottom: 10),'Seans Sayısı: $numberOfSession',AppTextStyles.GroupTextStyle(true)),
        Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              container: AppContainers.purpleButtonContainer(null),
              onTap: () {},
              text: 'Katıl',
            )),
        const SizedBox(
          height: 15,
        )
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
      children: [
        Text(text, style: AppTextStyles.GroupTextStyle(true)),
        InkWell(
            onTap: func,
            child: participantContainer(
              therapist,
              50,
              width,
            )),
      ],
    );
  }
}
