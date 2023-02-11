import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/screen/group/component/group_information_container.dart';
import 'package:terapievim/screen/group/component/heading.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';
import 'package:terapievim/screen/group/util/text_util.dart';

class GroupCategories extends StatefulWidget {
  const GroupCategories({super.key});

  @override
  State<GroupCategories> createState() => _GroupCategoriesState();
}

class _GroupCategoriesState extends State<GroupCategories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Heading(headingText: GroupTexts.groupCategoriesHeading),
            listOfGroupCategories(),
          ],
        ),
      ),
    );
  }

  Widget listOfGroupCategories() {
    int geciciKategoriSayisi = 5;
    String tmpGroupName = "Anksiyete";
    CardModel tmpMainTherapist =
        CardModel(imagePath: GroupTexts.imagePath, title: "Simay Selli");
    CardModel tmpSecondTherapist =
        CardModel(imagePath: GroupTexts.imagePath, title: "Ilknur Tulgar");
    int tmpParticipantNumber = 10;
    int tmpSessionNumber = 2;
//bu kisimlar gostermelik gecici

    return ListView.builder(
      shrinkWrap: true,
      itemCount: geciciKategoriSayisi,
      itemBuilder: (context, index) => Padding(
        padding: GroupPaddings.groupCategoryPadding,
        child: GroupInformationContainer(
            groupName: tmpGroupName,
            mainTherapist: tmpMainTherapist,
            secondTherapist: tmpSecondTherapist,
            numberOfParticipant: tmpParticipantNumber,
            numberOfSession: tmpSessionNumber),
      ),
    );
  }
}
