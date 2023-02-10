import 'package:flutter/material.dart';
import 'package:terapievim/screen/activity/component/filter_box.dart';
import 'package:terapievim/screen/login/component/custom_textfield.dart';
import 'package:terapievim/screen/group/component/group_box.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});
  TextEditingController activityTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _sizedbox(),
                CustomTextField(
                  isPhoneNumber: false,
                  isBig: true,
                  isPassword: true,
                  isRowModel: true,
                  rowModel: searchModel,
                  textController: activityTextController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Yaklaşan Aktiviteler"),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
                  ],
                ),
                ActivityBox(
                    isactivity: true,
                    customButton: customButton,
                    arowModel: arow_model,
                    ayrowwModel: ayrow_model,
                    clockModel: clock_model),
                _sizedbox(),
                ActivityBox(
                    isactivity: true,
                    customButton: customButton,
                    arowModel: arow_model,
                    ayrowwModel: ayrow_model,
                    clockModel: clock_model),
                _sizedbox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Geçmiş Aktiviteler"),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
                  ],
                ),
                ActivityBox(
                    isactivity: true,
                    customButton: againButton,
                    arowModel: arow_model,
                    ayrowwModel: ayrow_model,
                    clockModel: clock_model),
                _sizedbox(),
                ActivityBox(
                    isactivity: true,
                    customButton: againButton,
                    arowModel: arow_model,
                    ayrowwModel: ayrow_model,
                    clockModel: clock_model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _sizedbox() {
    return SizedBox(
      height: 15,
    );
  }
}
