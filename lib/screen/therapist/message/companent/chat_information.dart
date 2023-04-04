import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/component/home/custom_container.dart';
import '../../../../core/base/models/card_model.dart';
import '../../../../core/base/models/container_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../screen/participant/message/message.dart';

class ChatInformation extends StatefulWidget {
  const ChatInformation({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  State<ChatInformation> createState() => _ChatInformationState();
}

ContainerModel? containerModel;

class _ChatInformationState extends State<ChatInformation> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(MessageScreen()),
      child: CustomContainer(
          time: DemoInformation.clock,
          containerModel: AppContainers.classicWhiteContainer,
          isThereCardModel: true,
          cardModel: widget.cardModel),
    );
  }
}
