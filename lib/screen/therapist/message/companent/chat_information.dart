import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
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
    return Container(
      width: 340,
      height: 60,
      decoration: AppBoxDecoration.sendDecoration,
      child: Row(
        children: [
          const CustomCircleAvatar(
              imagePath: "assets/images/doctorfotosu.jpeg",
              big: false,
              shadow: false),
          rowView(rowModel, const EdgeInsets.all(8)),
        ],
      ),
    );
  }
}

RowModel rowModel = RowModel(
    text: "Okb danışan",
    textStyle: AppTextStyles.aboutMeTextStyle(false),
    trailingIcon: const Text("11:20"),
    isAlignmentBetween: false);
