import 'package:flutter/material.dart';
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
          child: Padding(
            padding: AppPaddings.pagePadding,
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
      ),
    );
  }

  Widget listOfGroupCategories() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DemoInformation.geciciKategoriSayisi,
      itemBuilder: (context, index) => Padding(
        padding: AppPaddings.componentPadding,
        child: GroupInformationContainer(
            groupName: DemoInformation.tmpGroupName,
            mainTherapist: DemoInformation.tmpMainTherapist,
            secondTherapist: DemoInformation.tmpMainTherapist,
            numberOfParticipant: DemoInformation.tmpParticipantNumber,
            numberOfSession: DemoInformation.tmpSessionNumber),
      ),
    );
  }
}
