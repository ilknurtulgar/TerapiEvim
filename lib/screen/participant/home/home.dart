import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/home/notification_from_ther_container.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/screen/participant/home/coping_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          headingtext(
            true,
            true,
            "TerapiEvim",
          ),
          headingtext(false, false, "Hoşgeldiniz"),
          copingmin(),
          notification()
        ],
      ),
    );
  }

  ListView notification() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NotificationFromTherContainer(
            cardModel: cardModelhome,
            explanation: home[index],
            buttonOnTap: () {},
            buttonText: "Detaylar");
      },
      itemCount: home.length,
    );
  }

  Padding copingmin() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SeminarMin(
          onTap: () {
            Get.to(const CopingMethods());
          },
          row: rowiModel,
          borderColor: AppColors.cornFlowerBlue),
    );
  }
}

Padding headingtext(bool isHeading, bool isPadding, String heading) {
  return Padding(
    padding: isPadding ? const EdgeInsets.only(top: 80) : EdgeInsets.zero,
    child: Text(
      heading,
      textAlign: TextAlign.center,
      style: AppTextStyles.heading(isHeading),
    ),
  );
}

List<String> home = [
  "fdvd",
  "fşdv",
  "fgbng",
  "yasemin",
  "gizem",
  "ilknur",
  "behzat"
];
CardModel cardModelhome = CardModel(
    subtitle: "Uzman Psikolog",
    imagePath: "assets/images/doctorfotosu.jpeg",
    title: "Günay Kara");

//////

//kalıcı
RowModel rowiModel = RowModel(
    text: "BAŞ ETME METOTLARI",
    textStyle: AppTextStyles.groupTextStyle(false),
    isAlignmentBetween: true,
    trailingIcon: IconUtility.arrowIcon);
