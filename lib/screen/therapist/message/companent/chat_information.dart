import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/home/custom_container.dart';
import 'package:terapievim/core/base/models/container_model.dart';
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
            isThereCardModel: false,
            time: DemoInformation.clock,
            containerModel: ContainerModel(
              borderRadius: 10,
              backgroundColor: Colors.white,
              width: 350,
              //height işlemiyor
              //  height: 72
            ),
            cardModel: DemoInformation.cardModelhome),
      ),
    );
  }
}
