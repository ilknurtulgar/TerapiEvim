import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.purpose,
    super.key,
  });
  final String purpose;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: widget.purpose == "gender" ? 51 : 36,
        decoration: AppBoxDecoration.lockScreenBox,
        width: widget.purpose == "gender" ? 340 : 135,
        child: choosebox(widget.purpose),
      ),
      Obx(
        () => activityController.selectedBox.value
            ? ChooseGender(widget: widget)
            : const SizedBox(),
      )
    ]);
  }
}

Obx choosebox(purpose) {
  return Obx(
    () => InkWell(
        onTap: () {
          activityController.changeBox();
        },
        child: SizedBox(
          width: 340,
          height: 50,
          child: purpose == "gender"
              ? Text(activityController.gender.value)
              : Text(activityController.order.value),
        )),
  );
}

class ChooseGender extends StatelessWidget {
  const ChooseGender({
    super.key,
    required this.widget,
  });

  final CustomDropDown widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppBoxDecoration.lockScreenBox,
        width: widget.purpose == "gender" ? 51 : 36,
        height: widget.purpose == "gender" ? 340 : 135,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                activityController.func(index, widget.purpose);
                activityController.changeBox();
              },
              child: SizedBox(
                width: 340,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: widget.purpose == "gender"
                      ? Text(activityController.genderList[index])
                      : Text(activityController.orderingList[index]),
                ),
              ),
            );
          },
          itemCount: activityController.genderList.length,
        ));
  }
}
