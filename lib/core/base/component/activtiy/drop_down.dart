import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/base_utility.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.width,
    required this.height,
    required this.selectedText,
    required this.textList,
    required this.isBoxSelected,
    required this.onDropDownTapped,
    required this.onValueSelected,
    required this.isLogin,
    this.alignment,
  });

  final double width;
  final double height;
  final RxBool isBoxSelected;

  final List<String> textList;
  final Function() onDropDownTapped;
  final Function(int) onValueSelected;
  final AlignmentGeometry? alignment;
  final RxString selectedText;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Align(
        alignment: alignment ?? Alignment.centerRight,
        child: SizedBox(
          width: Responsive.width(width, context),
          child: Column(
            children: [
              InkWell(
                onTap: onDropDownTapped,
                child: Container(
                    alignment: Alignment.center,
                    decoration: isLogin
                        ? AppBoxDecoration.dropDownDecoration
                        : AppBoxDecoration.purpleBorder,
                    height: height,
                    width: Responsive.width(width, context),
                    child: Obx(() => Text(selectedText.value))),
              ),
              Obx(
                () => isBoxSelected.value
                    ? _DropDownList(
                        isLogin: isLogin,
                        onSelected: (int value) {
                          isBoxSelected.value = false;
                          onValueSelected(value);
                        },
                        setString: selectedText,
                        textList: textList,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropDownList extends StatelessWidget {
  const _DropDownList({
    required this.setString,
    required this.textList,
    required this.onSelected,
    required this.isLogin,
  });

  final List<String> textList;
  final RxString setString;
  final bool isLogin;
  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isLogin
          ? AppBoxDecoration.dropDownDecoration
          : AppBoxDecoration.purpleBorder,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setString.value = textList[index];
              onSelected(index);
            },
            child: Padding(
                padding: AppPaddings.componentPadding,
                child: Text(
                  textList[index],
                  textAlign: TextAlign.center,
                )),
          );
        },
        itemCount: textList.length,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
