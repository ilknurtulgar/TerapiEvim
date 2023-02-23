import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/message/companent/person_view.dart';

class SearchMessage extends StatefulWidget {
  const SearchMessage({super.key});

  @override
  State<SearchMessage> createState() => _SearchMessageState();
}

List<String> personList = [
  "İrem Derici",
  "Canan Karatay",
  "Ecem Kara",
  "Nur Kara"
];

class _SearchMessageState extends State<SearchMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              searchappbar(),
              PersonView(gruopName: "anksiyete", list: personList),
              PersonView(gruopName: "panik atak", list: personList),
              PersonView(gruopName: "anksiyete", list: personList),
              PersonView(gruopName: "panik atak", list: personList),
              PersonView(gruopName: "anksiyete", list: personList),
              PersonView(gruopName: "panik atak", list: personList),
              PersonView(gruopName: "anksiyete", list: personList),
              PersonView(gruopName: "panik atak", list: personList),
            ],
          ),
        ),
      ),
    );
  }

  Column searchappbar() {
    return Column(
      children: [
        search(RowModel(
            text: "Ara",
            textStyle: AppTextStyles.normalTextStyle("medium", true),
            isAlignmentBetween: true,
            leadingIcon: const Icon(Icons.search),
            trailingIcon: const Icon(Icons.close))),
        const Divider(
          height: 3,
          color: Colors.grey,
        )
      ],
    );
  }
}
