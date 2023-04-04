import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.width,
    required this.height,
    required this.selectedText,
    required this.textList,
    required this.isBoxSelected,
    required this.onDropDownTapped,
  });

  final double width;
  final double height;
  final RxBool isBoxSelected;

  final List<String> textList;
  final Function() onDropDownTapped;

  final RxString selectedText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: SizedBox(
        width: Responsive.width(width, context),
        child: Column(
          children: [
            InkWell(
              onTap: onDropDownTapped,
              child: Container(
                  alignment: Alignment.center,
                  decoration: AppBoxDecoration.purpleBorder,
                  height: height,
                  width: Responsive.width(width, context),
                  child: Obx(() => Text(selectedText.value))),
            ),
            Obx(
              () => isBoxSelected.value
                  ? _DropDownList(
                      onSelected: () {
                        isBoxSelected.value = false;
                      },
                      setString: selectedText,
                      textList: textList,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textpurpose(property) {
  return Text(
    property,
  );
}

class _DropDownList extends StatelessWidget {
  const _DropDownList({
    required this.setString,
    required this.textList,
    required this.onSelected,
  });

  final List<String> textList;
  final RxString setString;

  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: AppBoxDecoration.purpleBorder,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setString.value = textList[index];
              onSelected();
            },
            child: Padding(
                padding: AppPaddings.componentPadding,
                child: Text(
                  textList[index],
                  textAlign: TextAlign.center,
                )),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
