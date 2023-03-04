import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/component/group/group_info_container.dart';
import '../../../../../core/base/component/group/custom_heading.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../../../../core/base/util/text_utility.dart';

class GroupCategories extends StatefulWidget {
  const GroupCategories({super.key});

  @override
  State<GroupCategories> createState() => _GroupCategoriesState();
}

class _GroupCategoriesState extends State<GroupCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeading(
                text: GroupTextUtil.groupCategoriesHeading,
                isalignmentstart: false,
              ),
              listOfGroupCategories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listOfGroupCategories() {
    int geciciKategoriSayisi = 5;
    String tmpGroupName = "Anksiyete";
    CardModel tmpMainTherapist =
        CardModel(imagePath: DemoInformation.imagePath, title: "Simay Selli");
    CardModel tmpSecondTherapist =
        CardModel(imagePath: DemoInformation.imagePath, title: "Ilknur Tulgar");
    int tmpParticipantNumber = 10;
    int tmpSessionNumber = 2;
//bu kisimlar gostermelik gecici

    return ListView.builder(
      shrinkWrap: true,
      itemCount: geciciKategoriSayisi,
      itemBuilder: (context, index) => Padding(
        padding: AppPaddings.groupCategoryPadding,
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
