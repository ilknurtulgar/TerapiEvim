import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.purpose,
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  final List<String> purpose;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

List<String> orderingList = ["yeniden eskiye", "eskiden yeniye"];
List<String> genderList = ["kadın", "erkek"];

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.lockScreenBox,
      height: widget.height,
      width: widget.width,
      child: Column(children: [
        choosebox(),
        Obx(
          () => activityController.selectedBox.value
              ? ChooseGender(widget: widget)
              : const SizedBox.shrink(),
        )
      ]),
    );
  }

  Widget choosebox() {
    return InkWell(
        onTap: () {
          activityController.changeBox();
        },
        child: textpurpose(widget.purpose[0]));
  }

  Align textpurpose(property) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        property,
      ),
    );
  }
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
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // activityController.func(index, widget.purpose);
              activityController.changeBox();
            },
            child: SizedBox(
                width: widget.width,
                height: widget.height,
                child: Text(
                  widget.purpose[index],
                  textAlign: TextAlign.center,
                )),
          );
        },
        itemCount: widget.purpose.length,
      ),
    );
  }
}
