import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

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
    return CustomContainer(
        time: "19:20",
        containerModel: ContainerModel(
          borderRadius: 15,
          backgroundColor: Colors.white,
          width: 350,
          //height işlemiyor
          //  height: 72
        ),
        cardModel: CardModel(
            subtitle: "Uzman Psikolog",
            imagePath: "assets/images/doctorfotosu.jpeg",
            title: "Canan Karatay"));
  }
}

RowModel rowModel = RowModel(
    text: "Okb danışan",
    textStyle: AppTextStyles.aboutMeTextStyle(false),
    trailingIcon: const Text("11:20"),
    isAlignmentBetween: false);
