import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/login/util/login_page_utility.dart';
import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/util/base_utility.dart';
class BeforeLogin extends StatelessWidget {
  const BeforeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: Padding(
        padding: AppPaddings.mediumPadding(2),
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            spacing: 12,
            children: [
              homeImage(),
              Text(LoginSignUpTextUtil.appName,style: AppTextStyles.heading(true),),
              Text(LoginSignUpTextUtil.welcome,style: AppTextStyles.normalTextStyle('medium', false),),
              questionText(),
              button(true),
              button(false),
            ],
          ),
        ),
      ),
    );
  }

  Text questionText() {
    return Text(
              LoginSignUpTextUtil.whoAreYou,
              style: AppTextStyles.normalTextStyle('medium', false),
              textAlign: TextAlign.center,
            );
  }

  SizedBox homeImage() {
    return SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: AssetImage(LoginSignUpTextUtil.homeImagePath)));
  }

  Padding button(bool isForParticipant) {
    return Padding(
      padding: AppPaddings.smallVerticalPadding,
      child: CustomButton(
                        container: LoginPageUtility.beforeLoginButtonContainer(),
                        onTap: () {/* login sayfasına git*/},
                        text: isForParticipant ? LoginSignUpTextUtil.participant : LoginSignUpTextUtil.therapist,
                        textColor: AppColors.white,),
    );
  }
}
