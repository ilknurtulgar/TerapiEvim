import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../ui_models/container_model.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.container,
      required this.textColor,
      required this.onTap,
      required this.text,
      this.icon});
  final ContainerModel container;
  final Function() onTap;
  final String text;
  final Icon? icon;
  final Color textColor;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.container.height,
        width: widget.container.width,
        decoration: containerDecoration(),
        child: insideTheButton(),
      ),
    );
  }

  Padding insideTheButton() {
    return Padding(
      padding: widget.container.width == null ? AppPaddings.customContainerInsidePadding(1) : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: widget.container.width != null
            ? MainAxisSize.max
            : MainAxisSize.min,
        children: [
          widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: widget.icon,
                )
              : const SizedBox(),
          Expanded(
            child: Text(
              widget.text,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: AppTextStyles.buttonTextStyle(widget.textColor),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: widget.container.shadowColor ?? Colors.transparent,
          width: widget.container.shadowColor != null ? 2 : 0),
      borderRadius: BorderRadius.circular(widget.container.borderRadius),
      color: widget.container.backgroundColor,
    );
  }
}
