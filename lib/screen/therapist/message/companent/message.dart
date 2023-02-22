import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/therapist/message/companent/chat_information.dart';
import 'package:terapievim/screen/therapist/message/companent/search_message.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              messageappbar(),
              const ChatInformation(),
              const ChatInformation(),
              const ChatInformation(),
              const ChatInformation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget messageappbar() {
    return rowView(
        RowModel(
            trailingIcon: IconButton(
                onPressed: () {
                  Get.to(const SearchMessage());
                },
                icon: const Icon(
                  Icons.mark_email_read_outlined,
                  size: 30,
                )),
            text: "Mesajlar",
            textStyle: AppTextStyles.heading(false),
            leadingIcon: const Icon(
              Icons.forum_outlined,
              size: 35,
            ),
            isAlignmentBetween: true),
        const EdgeInsets.all(15));
  }
}
