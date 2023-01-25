import 'package:flutter/material.dart';
import 'package:terapievim/components/image/custom_circle_avatar.dart';
import 'package:terapievim/models/card_model.dart';
import 'package:terapievim/models/container_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.containerModel,
      required this.cardModel,
      required this.time,
      this.widget});
  final ContainerModel containerModel;
  final CardModel cardModel;
  final String time;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        color: containerModel.backgroundColor,
        shadowColor: containerModel.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(containerModel.borderRadius),
          side: BorderSide(color: containerModel.shadowColor ?? Colors.transparent,width: containerModel.shadowColor!=null ? 2 : 0 ) 
        ),
        child: SizedBox(
          height: containerModel.height,
          width: containerModel.width,
          child: Column(
            children: [
              ListTile(
                leading: customCircleAvatar(cardModel.imagePath, false, false),
                title: Text(cardModel.title),
                subtitle: Text(cardModel.subtitle),
                trailing: Text(time),
              ),
              widget ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
