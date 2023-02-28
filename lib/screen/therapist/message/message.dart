import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/therapist/message/companent/chat_information.dart';
import 'package:terapievim/screen/therapist/message/search_message.dart';

import '../../../controller/t_message_controller.dart';

class TherapistMessageScreen extends StatefulWidget {
  const TherapistMessageScreen({super.key});

  @override
  State<TherapistMessageScreen> createState() => _TherapistMessageScreenState();
}

class _TherapistMessageScreenState extends State<TherapistMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            messageappbar(
                MessageUtil.messageapptext,
                MessageUtil.messageIcon,
                IconButton(
                    onPressed: () {
                      Get.to(const SearchMessage());
                    },
                    icon: MessageUtil.addmesaage)),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const ChatInformation();
                },
                itemCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TherapistyMessageController therapistyMessageController =
    Get.put(TherapistyMessageController());

Widget messageappbar(
    String apptext, Widget? leadingIcon, Widget? trailingIcon) {
  return rowView(
      RowModel(
          trailingIcon: trailingIcon ?? const SizedBox.shrink(),
          text: apptext,
          textStyle: AppTextStyles.heading(false),
          leadingIcon: leadingIcon,
          isAlignmentBetween: true),
      MessageUtil.appmpadding);
}

class MessageUtil {
  static const Icon messageIcon = Icon(
    Icons.forum_outlined,
    size: 35,
  );
  static const Icon addmesaage = Icon(
    Icons.mark_email_read_outlined,
    size: 30,
  );

  static const EdgeInsets appmpadding = EdgeInsets.all(15);

  static const String messageapptext = "Mesajlar";
  static const String searchtext = "Ara";
}
