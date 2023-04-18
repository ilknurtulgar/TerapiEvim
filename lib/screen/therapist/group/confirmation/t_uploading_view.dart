import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/group/t_uploaded_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import 't_lock_view.dart';

class TUploadConfirmView extends StatelessWidget {
  const TUploadConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TUploadedController>(
      getController: TUploadedController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: GroupTextUtil.confirmingText),
        body: SafeArea(
            child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: AppPaddings.appBarPadding,
                width: SizeUtil.generalWidth,
                decoration: AppBoxDecoration.purpleBorder,
                // height: SizeUtil.bigValueHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      GroupTextUtil.whyConfirmingText,
                      style: AppTextStyles.aboutMeTextStyle(false),
                    ),
                    const SizedBox(
                      height: SizeUtil.normalValueHeight,
                    ),
                    Text(
                      GroupTextUtil.pdfUploadingText,
                      style: AppTextStyles.aboutMeTextStyle(false),
                    ),
                    sizedBox(),
                    CustomButton(
                        textColor: AppColors.white,
                        container: AppContainers.purpleButtonContainer(
                            SizeUtil.smallValueWidth),
                        onTap: () {
                          //yukleyeccek
                        },
                        text: GroupTextUtil.uploadText),
                    // smallSizedBox()
                  ],
                ),
              ),
              // const SizedBox(
              //   height: SizeUtil.normalValueHeight,
              // ),
              CustomButton(
                  textColor: AppColors.white,
                  container: AppContainers.purpleButtonContainer(
                      SizeUtil.smallValueWidth),
                  onTap: () {
                    controller.changeIsTherapistLoaded();
                    //birde burdaa diger controllerla baglanti kurup giris yapilmasi lazim
                    context
                        .pop(); //iki kere yapmam gerekiyor cunku lock screeenin tekrar build edilmesi gerekiyor
                    context.pop();
                    context.push(const TLockView());
                  },
                  text: GroupTextUtil.confirmText)
            ],
          ),
        )),
      ),
    );
  }
}
