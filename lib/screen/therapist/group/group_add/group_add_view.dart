import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/choosing_time_group_therapy.dart';
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

    List<PersonMin> days = [
      day("Pazartesi"),
      day("Sali"),
      day("Carsamba"),
      day("Persembe"),
      day("Cuma"),
      day("Cumartesi"),
      day("Pazar"),
    ];

    List<PersonMin> persons = [
      person("Nihat Turgutlu", context),
      person("Mikasa Ackerman", context),
      person("Eren Jeager", context),
      person("Levi Ackerman", context)
    ];

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
                        onPressed: () {
                          //geri donus yapmasi lazim
                        },
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
              election(controller, persons, false),
              button(controller, false),
              miniHeadings("Gorusme Tarihi", false),
              miniHeadings("Gun", true),
              election(controller, days, true),
              miniHeadings("Saat", true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ChoosingTimeGroupTherapy(),
              ),
              button(controller, true)
            ],
          )),
    ));
  }

  Padding button(TherapistGroupController controller, bool isLastButton) {
    return Padding(
      padding: isLastButton
          ? const EdgeInsets.symmetric(vertical: 24.0)
          : const EdgeInsets.only(
              left: 150,
              top: 30,
            ),
      child: CustomButton(
          container: isLastButton
              ? AppContainers.purpleButtonContainer(140)
              : AppContainers.lightPurpleButtonContainer(173),
          textColor: isLastButton ? AppColors.white : AppColors.meteorite,
          onTap: () {
            if (isLastButton) {
            } else {
              controller.ChoosenSecTherapist("Eren Jager");
            }
          },
          text: isLastButton ? "Grup Olustur" : "Bana Psikolog Bul"),
    );
  }

  PersonMin person(String therapistName, BuildContext context) {
    String imagePath = "assets/images/doctorfotosu.jpeg";
    TherapistGroupController controller = Get.find();
    return PersonMin(
        padding: EdgeInsets.only(top: 10),
        borderColor: AppColors.cornFlowerBlue,
        onTap: () {
          secTherapistChooseDialog(context, therapistName, controller);
        },
        row: RowModel(
            text: therapistName,
            leadingIcon: CustomCircleAvatar(
                big: false, imagePath: imagePath, shadow: false),
            textStyle: AppTextStyles.groupTextStyle(true),
            isAlignmentBetween: true,
            trailingIcon: IconUtility.chatIcon));
  }

  Future<String?> secTherapistChooseDialog(BuildContext context,
      String therapistName, TherapistGroupController controller) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
            "$therapistName kişisine yardımcı psikolog teklifi göndermek istediğinize emin misiniz?"),
        content: const Text(
            'İstek gönderildikten itibaren geri dönüt alınmadan başka bir yardımcı terapiste istekte bulunulamaz.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              controller.ChoosenSecTherapist(therapistName);
              controller.ChangeSecTherapistElection();
              Get.back();
            },
            child: const Text('İstek Gonder'),
          ),
        ],
      ),
    );
  }

  PersonMin day(String dayName) {
    TherapistGroupController controller = Get.find();
    return PersonMin(
        height: 48,
        padding: EdgeInsets.only(top: 10),
        onTap: () {
          controller.ChangeChoosenDay(dayName);
          controller.ChangeDayElection();
        },
        row: RowModel(
            isAlignmentBetween: false,
            text: dayName,
            textStyle: AppTextStyles.buttonTextStyle(AppColors.black)));
  }

  Widget election(
      TherapistGroupController controller, List<PersonMin> rows, bool isDay) {
    bool election = isDay
        ? controller.isDayElectionOpen.value
        : controller.isSecTherapistElectionOpen.value;
    double padding;
    if (isDay) {
      padding = 150 - 2.2 * controller.ChoosenDay.value.length;
    } else {
      padding = 150 - 2.2 * controller.ChoosenSecTherapist.value.length;
    }

    return Obx(() => Column(
          children: [
            SeminarMin(
                onTap: () {
                  isDay
                      ? controller.ChangeDayElection()
                      : controller.ChangeSecTherapistElection();
                },
                row: RowModel(
                    text: isDay
                        ? controller.ChoosenDay.value
                        : controller.ChoosenSecTherapist.value,
                    textStyle: AppTextStyles.buttonTextStyle(AppColors.black),
                    isAlignmentBetween: true,
                    trailingIcon: Padding(
                      padding: EdgeInsets.only(
                        left: padding.toDouble(),
                      ),
                      child: Icon(
                        election
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down_sharp,
                        size: 30,
                      ),
                    ))),
            election
                ? SizedBox(
                    width: 294,
                    child: ListView(
                      shrinkWrap: true,
                      children: rows,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }

  Widget miniHeadings(String name, bool isInMiddle) {
    return rowView(
        RowModel(
            text: name,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: false),
        EdgeInsets.symmetric(vertical: 16, horizontal: isInMiddle ? 10 : 0));
  }
}
