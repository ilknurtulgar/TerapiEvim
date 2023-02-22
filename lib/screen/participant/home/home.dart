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
          mindetailesbox(
              "BAŞ ETME METOTLARI", () => Get.to(const CopingMethods())),
          notification(cardModelhome, home, home.length)
        ],
      ),
    );
  }
}

ListView notification(
    CardModel cardmodel, List<String> explanation, int itemlenght) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return NotificationFromTherContainer(
          cardModel: cardmodel,
          explanation: explanation[index],
          buttonOnTap: () {},
          buttonText: "Detaylar");
    },
    itemCount: itemlenght,
  );
}

Padding mindetailesbox(String rowmodeltext, Function()? onTap) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SeminarMin(
        onTap: onTap,
        row: rowModel(rowmodeltext),
        borderColor: AppColors.cornFlowerBlue),
  );
}

Widget headingtext(bool isHeading, bool isPadding, String heading) {
  return Padding(
      padding: isPadding
          ? const EdgeInsets.only(
              top: 80,
            )
          : EdgeInsets.zero,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          heading,
          style: AppTextStyles.heading(isHeading),
        ),
      ));
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

RowModel rowModel(String rowmodeltext) {
  return RowModel(
      text: rowmodeltext,
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: true,
      trailingIcon: IconUtility.arrowIcon);
}
