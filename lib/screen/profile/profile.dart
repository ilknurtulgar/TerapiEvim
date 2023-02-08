import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:terapievim/components/text/custom_text.dart';
import 'package:terapievim/screen/group/component/purple_border_text_ccontainer.dart';
import 'package:terapievim/screen/group/participant_ui/therapist.dart';
import 'package:terapievim/screen/login/component/custom_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              CustomTextField(
                isPhoneNumber: true,
                isBig: true,
                isColor: true,
                isPassword: false,
                isRowModel: true,
                rowModel: leadingModel,
              ),
              CustomTextField(
                isPhoneNumber: true,
                isBig: true,
                isColor: true,
                isPassword: false,
                isRowModel: true,
                rowModel: trailingModel,
              ),
              CustomTextField(
                isBig: true,
                isPhoneNumber: true,
                isColor: true,
                isPassword: false,
                isRowModel: true,
                rowModel: trailingModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
