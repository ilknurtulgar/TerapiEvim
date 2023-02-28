import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/home/home.dart';

class AddHoursScreen extends StatelessWidget {
  const AddHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headingtext(false, true, "Yeni Saat Ekleme "),
          minheading("Tarih"),
          minheading("Saat Ekle"),
          minheading("Saatler"),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  container: AppContainers.containerButton(true),
                  textColor: AppColors.white,
                  onTap: () {},
                  text: "Kaydet"),
            ),
          )
        ],
      ),
    );
  }

  CustomHeading minheading(String text) {
    return CustomHeading(
      text: text,
      isalignmentstart: true,
      isToggle: true,
    );
  }
}
