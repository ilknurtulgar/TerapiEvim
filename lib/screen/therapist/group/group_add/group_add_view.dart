import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class GroupAddView extends StatelessWidget {
  const GroupAddView({super.key});

  @override
  Widget build(BuildContext context) {
    TherapistGroupController controller = Get.put(TherapistGroupController());
    TextEditingController groupNameController = TextEditingController();

    //gecici
    PersonMin person = PersonMin(
        padding: EdgeInsets.only(top: 10),
        borderColor: AppColors.cornFlowerBlue,
        onTap: () {},
        row: RowModel(
            text: "Nihat Turgutlu",
            leadingIcon: CustomCircleAvatar(
                big: false,
                imagePath: "assets/images/doctorfotosu.jpeg",
                shadow: false),
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: false));

    return SafeArea(
        child: SingleChildScrollView(
      child: Obx(() => Column(
            children: [
              rowView(
                  RowModel(
                      text: "Grup Ekle",
                      textStyle: AppTextStyles.heading(false),
                      isAlignmentBetween: true,
                      trailingIcon: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 30,
                          color: AppColors.meteorite,
                        ),
                        onPressed: () {},
                      )),
                  EdgeInsets.symmetric(vertical: 32, horizontal: 30)),
              miniHeadings("Grup Ismi", false),
              CustomTextField(
                  isPhoneNumber: false,
                  isBig: true,
                  textController: groupNameController,
                  isPassword: false,
                  isRowModel: false),
              miniHeadings("Yardimci Psikolog", false),
              SeminarMin(
                  onTap: () {
                    controller.ChangeSecTherapistElection();
                  },
                  row: RowModel(
                      text: "Yok",
                      textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
                      isAlignmentBetween: false,
                      trailingIcon: Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: Icon(
                          controller.isSecTherapistElectionOpen.isTrue
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down_sharp,
                          size: 30,
                        ),
                      ))),
              controller.isSecTherapistElectionOpen.isTrue
                  ? SizedBox(
                      width: 294,
                      child: ListView(
                        children: [person, person, person, person],
                        shrinkWrap: true,
                      ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 150,
                  top: 30,
                ),
                child: CustomButton(
                    container: AppContainers.lightPurpleButtonContainer(173),
                    textColor: AppColors.meteorite,
                    onTap: () {},
                    text: "Bana Psikolog Bul"),
              ),
              miniHeadings("Gorusme Tarihi", false),
              miniHeadings("Gun", true)
            ],
          )),
    ));
  }

  Widget miniHeadings(String grupIsmi, bool isInMiddle) {
    return rowView(
        RowModel(
            text: grupIsmi,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: false),
        EdgeInsets.symmetric(vertical: isInMiddle ? 24 : 16));
  }
}
