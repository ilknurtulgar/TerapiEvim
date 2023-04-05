import 'package:flutter/material.dart';

class ContainerModel {
  double? width; //  buton genişliği içindeki yazıların uzunluğuna göre değişebileceği için custombutton'ın row'unun mainaxissize'ını min yaptım bu sayede width almaya gerek kalmadı
  double? height; // paylaşımdaki yazılar ne kadar uzunsa container uzunlukta olsun diye height'ı required yapmadım bu yüzden custom container'da columnda mainaxissize'a mainaxisize.min verdim
  double borderRadius; 
  Color backgroundColor;
  Color? shadowColor;
  ContainerModel({
    this.width,
    this.height,
    required this.borderRadius,
    required this.backgroundColor,
    this.shadowColor,
  });
}
