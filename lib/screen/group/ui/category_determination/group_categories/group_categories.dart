import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:terapievim/models/card_model.dart';
import 'package:terapievim/screen/group/component/group_information_container.dart';
import 'package:terapievim/screen/group/component/heading.dart';

class GroupCategories extends StatefulWidget {
  const GroupCategories({super.key});

  @override
  State<GroupCategories> createState() => _GroupCategoriesState();
}

class _GroupCategoriesState extends State<GroupCategories> {
  String heading = "Katilabileceginiz Gruplar";
  String imagePath = "assets/images/doctorfotosu.jpeg";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Heading(headingText: heading),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24),
                  child: GroupInformationContainer(
                      groupName: "Anksiyete",
                      mainTherapist:
                          CardModel(imagePath: imagePath, title: "Simay Selli"),
                      secondTherapist: CardModel(
                          imagePath: imagePath, title: "Ilknur Tulgar"),
                      numberOfParticipant: 10,
                      numberOfSession: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
