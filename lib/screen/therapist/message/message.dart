import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';
import 'package:terapievim/screen/therapist/message/search_message.dart';

import '../../../core/base/util/text_utility.dart';
import 'companent/chat_information.dart';

class TherapistMessageScreen extends StatefulWidget {
  const TherapistMessageScreen({super.key});

  @override
  State<TherapistMessageScreen> createState() => _TherapistMessageScreenState();
}

class _TherapistMessageScreenState extends State<TherapistMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          children: [
            secappview(UiBaseModel.secRowModel(
              IconButton(
                  onPressed: () {
                    context.push(const SearchMessage());
                  },
                  icon: IconUtility.addmesaage),
              MessageTextUtil.messageapptext,
            )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatInformation(
                    cardModel: DemoInformation.cardModelhome,
                  );
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
