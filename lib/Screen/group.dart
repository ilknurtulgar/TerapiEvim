import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../core/base/util/base_utility.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});
  bool _isTestNotCompleted = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
            onPressed: () => _show(context), child: Text("Group")),
      ),
    );
  }

  dynamic _show(context) {
    String text = "Henüz Grubunuz Belli Olmadığı İçin Burası Kilitli";
    String text2 = "Testi kontrol ettikten sonra grubunuz açılır";
    return showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (BuildContext ctx) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    color: AppColors.white,
                    size: 100,
                  ),

                  //NoTest(text),
                  UncheckedTest(text2),
                ]),
          );
        });
  }

  Column UncheckedTest(String text2) {
    return Column(
      children: [
        SizedBox(
          height: 95,
        ),
        Container(
          width: 225,
          height: 56,
          child: Text(
            text2,
            style: AppTextStyles.pagesBoldTitleStyle(false)
                .copyWith(color: AppColors.white),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        TextButton(
          child: Text("Home",
              style: AppTextStyles.heading(false).copyWith(
                color: AppColors.white,
              )),
          onPressed: () {
            print("Hello bitch");
          },
        )
      ],
    );
  }

  Column NoTest(String text) {
    return Column(
      children: [
        SizedBox(
          height: 45,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: 250,
            height: 100,
            color: Colors.transparent,
            child: Text(
              text,
              style: AppTextStyles.heading(false).copyWith(
                color: AppColors.white,
              ),
            )),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Blablabla",
            style: AppTextStyles.aboutMeTextStyle(false),
          ),
          width: 342,
          height: 200,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.cornFlowerBlue)),
        ),
        SizedBox(
          height: 40,
        ),
        GestureDetector(
            onTap: () {
              print("Hello bitch");
            },
            child: Container(
              width: 246,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.cornFlowerBlue,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Text(
                  "Testi Cozmek Icin Tiklayiniz",
                  style: AppTextStyles.informationBoxTextStyle(true, true)
                      .copyWith(color: AppColors.white),
                ),
              ),
            ))
      ],
    );
  }
}
