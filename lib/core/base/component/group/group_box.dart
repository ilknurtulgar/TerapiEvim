import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/ui_models/container_model.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/product/widget/t_activity/row_button.dart';

class ActivityBox extends StatelessWidget {
  ActivityBox({
    super.key,
    required this.istwobutton,
    required this.buttonText,
    required this.containerModel,
    required this.arowModel,
    required this.isactivity,
    required this.clockModel,
    this.leftButtonTapped,
    this.onTap,
    this.ayrowwModel,
    required this.rightButtonTap,
  });

  final ContainerModel containerModel;
  final RowModel arowModel;
  final RowModel? ayrowwModel;
  final RowModel clockModel;
  final bool isactivity;
  final bool istwobutton;
  final Function()? leftButtonTapped, onTap;
  final Function() rightButtonTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isactivity ? null : onTap,
      child: Padding(
        padding: AppPaddings.componentPadding,
        child: Container(
          height: SizeUtil.doubleNormalValueHeight,
          decoration: AppBoxDecoration.purpleBorder,
          child: Column(
            children: [
              Expanded(
                  child: RowView(
                      rowModel: arowModel,
                      padding: AppPaddings.rowViewPadding)),
              isactivity
                  ? const SizedBox.shrink()
                  : (ayrowwModel == null
                      ? const SizedBox.shrink()
                      : RowView(
                          rowModel: ayrowwModel!,
                          padding: AppPaddings.rowViewPadding)),
              RowView(
                  rowModel: clockModel, padding: AppPaddings.rowViewPadding),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    istwobutton
                        ? RowButton(
                            buttonText: ActivityTextUtil.updateMyInformation,
                            containerbutton:
                                AppContainers.hugeContainerButton(),
                            onTap: leftButtonTapped == null
                                ? null
                                : leftButtonTapped)
                        : SizedBox.shrink(),
                    RowButton(
                        buttonText: buttonText,
                        containerbutton: AppContainers.containerButton(false),
                        onTap: rightButtonTap),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
