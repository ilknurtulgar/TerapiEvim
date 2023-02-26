import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/component/login/custom_textfield.dart';
import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_utility.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, this.rowmodel});
  final RowModel? rowmodel;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: sendbox(),
      body: SafeArea(
        child: Column(
          children: [
            messageappbar(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: divider(),
            ),
            Expanded(
              child: SingleChildScrollView(child: messageexpanded(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget sendbox() {
    return Container(
      color: Colors.white,
      height: 65,
      width: window.physicalSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextField(
            textController: textEditingController,
            isPhoneNumber: false,
            isBig: false,
            isPassword: false,
            isRowModel: false,
          ),
          IconButton(onPressed: () {}, icon: IconUtility.sendIcon),
        ],
      ),
    );
  }

  Column messageexpanded(BuildContext context) {
    return Column(children: [
      messagecontainer(context, true,
          "Flutter, Google tarafından oluşturulan açık kaynaklı bir UI yazılım geliştirme kitidir. Android, iOS, Windows, Mac, Linux ve web için uygulamalar geliştirmek için kullanılıyor. Flutter'ın ilk sürümü  olarak biliniyordu ve Android işletim sisteminde çalışıyordu."),
      messagecontainer(context, false,
          "Firebase, Google tarafından mobil ve web uygulamaları oluşturmak için geliştirilmiş bir platformdur. Bağımsız bir şirket olarak 2011 senesinde kuruldu. Google 2014'te platformu satın aldı. Şirket, uygulama geliştirme konusunda Google'ın öncü hizmetidir."),
      messagecontainer(context, true,
          "Firebase Authentication provides backend services, easy-to-use SDKs, and ready-made UI libraries to authenticate users to your app. It supports authentication using passwords, phone numbers, popular federated identity providers like Google, Facebook and Twitter, and "),
      messagecontainer(context, false, "oke")
    ]);
  }

  Divider divider() {
    return const Divider(
      color: AppColors.black,
      height: 5,
    );
  }

  Row messagecontainer(BuildContext context, bool isStart, String message) {
    return Row(
      mainAxisAlignment:
          isStart ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        isStart
            ? circleavatar()
            : Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 5,
                ),
                child: constrainedbox(context, message),
              ),
        isStart ? constrainedbox(context, message) : circleavatar()
      ],
    );
  }

  ConstrainedBox constrainedbox(BuildContext context, String message) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 10, maxWidth: MediaQuery.of(context).size.width - 180),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.cornFlowerBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget messageappbar() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleavatar(),
          CustomHeading(text: "Melisa Kara", isalignmentstart: false),
        ],
      ),
    );
  }

  Widget circleavatar() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomCircleAvatar(
          imagePath: "assets/images/doctorfotosu.jpeg",
          big: false,
          shadow: false),
    );
  }
}
