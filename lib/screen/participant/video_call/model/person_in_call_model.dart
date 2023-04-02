import 'package:get/get.dart';

class PersonInCallModel {
  String name;
  String surname;
  String imagePath; // şu an daha videocall backend hazır olmadığı için geçici olarak fotoğrafları kullandım
  RxBool isCamOn;
  RxBool isMicOn;
  RxBool? isHandsUp;
  PersonInCallModel({
    required this.name,
    required this.surname,
    required this.imagePath,
    required this.isMicOn,
    required this.isCamOn,
    this.isHandsUp
  }) {
     isHandsUp ??= false.obs;
  }
}
