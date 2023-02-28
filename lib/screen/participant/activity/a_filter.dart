import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/participant/activity/filter_details.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Filtreleme",
                  textAlign: TextAlign.start,
                  style: AppTextStyles.normalTextStyle("big", false),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Temizle",
                          style: AppTextStyles.normalTextStyle("small", false),
                        )),
                    IconButton(onPressed: () {}, icon: IconUtility.closeIcon)
                  ],
                ),
              ],
            ),
            filtermin("Psikolog", () {
              print("tıklıyorum ya");
              Get.to(FilterDetails());
            }, IconUtility.arrowIcon),
            filtermin("Tarih", () {}, IconUtility.arrowIcon),
            filtermin("Konu", () {}, IconUtility.arrowIcon),
          ],
        ),
      ),
    );
  }
}

Widget filtermin(String heading, Function()? onTap, Icon icon) {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    width: 342,
    height: 56,
    decoration: AppBoxDecoration.sendDecoration,
    child: activityminto(
        heading, onTap, MainAxisAlignment.spaceBetween, false, icon),
  );
}
