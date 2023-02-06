import 'package:flutter/material.dart';
import 'package:terapievim/components/container/method_downloading_container.dart';
import 'package:terapievim/components/text/drop_down.dart';
import 'package:terapievim/components/text/drop_down_widget.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/card_model.dart';
import 'package:terapievim/screen/home/home.dart';

class CopingMethods extends StatelessWidget {
  const CopingMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "BAŞ ETME METOTLARI",
                style: AppTextStyles.heading(true),
              ),
              DropDownWidget(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return MethodDownloadingContainer(
                      cardModel: cardModelhome,
                      time: "25 Ocak 2023,20:00",
                      explanation: home[index],
                      buttonOnTap: () {},
                      buttonText: "bas_etme_metotlari.pdf");
                },
                itemCount: home.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}