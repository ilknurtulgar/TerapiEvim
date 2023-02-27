import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.only(bottom: 30),
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            spacing: 15,
            children: [
              homeImage(),
              Text('Terapi Evim',style: AppTextStyles.heading(true),),
              Text('Hoşgeldiniz',style: AppTextStyles.normalTextStyle('medium', false),),
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
                  '''Kim olarak uygulamaya devam
etmek istersiniz?''',
                  style: AppTextStyles.normalTextStyle('medium', false),
                  textAlign: TextAlign.center,
                );
  }

  SizedBox homeImage() {
    return const SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: AssetImage('assets/images/home.jpg')));
  }

  Padding button(bool isForParticipant) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CustomButton(
                        container: LoginPageUtility.beforeLoginButtonContainer(),
                        onTap: () {/* login sayfasına git*/},
                        text: isForParticipant ? 'Danışan' : 'Psikolog',
                        textColor: AppColors.white,),
    );
  }
}
