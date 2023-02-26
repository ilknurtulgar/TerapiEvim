import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/home/home.dart';

class NewActivityScreen extends StatefulWidget {
  const NewActivityScreen({super.key});

  @override
  State<NewActivityScreen> createState() => _NewActivityScreenState();
}

const bool isUpdate = true;

class _NewActivityScreenState extends State<NewActivityScreen> {
  TextEditingController activitynamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            isUpdate
                ? headingtext(false, true, "Aktivite Güncelleme")
                : headingtext(false, true, "Yeni Aktivite"),
            activityname("Etkinlik İsmi", padding.startpadding),
            CustomTextField(
                isPhoneNumber: false,
                isBig: true,
                textController: activitynamController,
                isPassword: false,
                isRowModel: false),
            activityname("Etkinlik Hakkında", padding.startpadding),
            Padding(
              padding:
                  const EdgeInsets.only(left: 9, right: 9, top: 10, bottom: 20),
              child: SizedBox(
                width: 350,
                height: 300,
                child: textfield(),
              ),
            ),
            Row(
              children: [
                activityname("Tarih", padding.startpadding),
                activityname("Saat", padding.centerpadding),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: SizedBox(width: 150, height: 52, child: textfield()),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(width: 150, height: 52, child: textfield()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 30),
              child: isUpdate
                  ? button("Güncelle", () {})
                  : button("Oluştur", () {}),
            )
          ],
        ),
      ),
    );
  }

  Align button(String buttonname, Function() onTap) {
    return Align(
      alignment: Alignment.bottomRight,
      child: CustomButton(
          container: ContainerModel(
              width: 150,
              height: 50,
              borderRadius: 15,
              backgroundColor: AppColors.butterflyBush),
          textColor: Colors.white,
          onTap: onTap,
          text: buttonname),
    );
  }

  TextField textfield() {
    return const TextField(
      maxLines: 100,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: AppColors.dustyGray,
                width: 1,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: AppColors.dustyGray,
                width: 1,
              ))),
    );
  }

  Padding activityname(String activityheading, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          activityheading,
          style: AppTextStyles.groupTextStyle(false),
        ),
      ),
    );
  }
}

class padding {
  static const EdgeInsets startpadding = EdgeInsets.only(left: 35, top: 35);
  static const EdgeInsets centerpadding = EdgeInsets.only(left: 150, top: 35);
}
