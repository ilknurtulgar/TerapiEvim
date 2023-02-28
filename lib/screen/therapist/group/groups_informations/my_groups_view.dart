import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/therapist/group/group_add/group_add_view.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/group_information.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({super.key}); //gecici modeller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              rowView(
                  RowModel(
                      text: "Gruplarim",
                      textStyle: AppTextStyles.heading(true),
                      isAlignmentBetween: true,
                      trailingIcon: IconButton(
                        onPressed: () {
                          Get.to(const GroupAddView());
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 40,
                          color: AppColors.meteorite,
                        ),
                      )),
                  const EdgeInsets.only(
                      top: 18, left: 30, right: 30, bottom: 40)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                    child: SeminarMax(
                        onTap: () {
                          Get.to(GroupInformation());
                        },
                        row1: DemoInformation.row_1,
                        row2: DemoInformation.row_2,
                        row3: DemoInformation.row_3,
                        borderColor: AppColors.cornFlowerBlue),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
