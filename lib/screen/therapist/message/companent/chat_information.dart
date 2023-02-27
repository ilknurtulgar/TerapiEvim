import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/message/message.dart';

class ChatInformation extends StatefulWidget {
  const ChatInformation({
    super.key,
  });

  @override
  State<ChatInformation> createState() => _ChatInformationState();
}

ContainerModel? containerModel;

class _ChatInformationState extends State<ChatInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () => Get.to(MessageScreen()),
        child: CustomContainer(
            time: "19:20",
            containerModel: ContainerModel(
              borderRadius: 10,
              backgroundColor: Colors.white,
              width: 350,
              //height işlemiyor
              //  height: 72
            ),
            isThereCardModel: true,
            cardModel: cardmodel()),
      ),
    );
  }

//deneme
  CardModel cardmodel() {
    return CardModel(
        subtitle: "Uzman Psikolog",
        imagePath: "assets/images/doctorfotosu.jpeg",
        title: "Canan Karatay");
  }
}

RowModel rowModel = RowModel(
    text: "Okb danışan",
    textStyle: AppTextStyles.aboutMeTextStyle(false),
    trailingIcon: const Text("11:20"),
    isAlignmentBetween: false);
