import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/components/container/notification_from_ther_container.dart';
import 'package:terapievim/components/container/seminers.dart';
import 'package:terapievim/components/text/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/card_model.dart';
import 'package:terapievim/screen/home/coping_methods.dart';
import 'package:terapievim/screen/home/main_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 90,
            ),
            child: Text(
              "Terapi Evim",
              textAlign: TextAlign.center,
              style: AppTextStyles.heading(true),
            ),
          ),
          Text(
            "Hogeldiniz ",
            textAlign: TextAlign.center,
            style: AppTextStyles.heading(false),
          ),
          SizedBox(
            height: 20,
          ),
          SeminarMin(
              onTap: () {
                print("çalişsana abi");

                Get.to(const CopingMethods());
              },
              row: rowiModel,
              border_color: AppColors.cornFlowerBlue),
          ListView.builder(
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
          )
        ],
      ),
    );
  }
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
