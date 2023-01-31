import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../models/container_model.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.container,
      required this.onTap,
      required this.text,
      this.icon});
  final ContainerModel container;
  final Function() onTap;
  final String text;
  final Icon? icon;
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
        decoration: containerDecoration(),
        child: insideTheButton(),
      ),
    );
  }

  Padding insideTheButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon ?? const SizedBox(),
          widget.icon != null
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(),
          Text(
            widget.text,
            style:
                AppTextStyles.buttonTextStyle(widget.container.backgroundColor),
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
