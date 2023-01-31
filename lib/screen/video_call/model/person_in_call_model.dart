class PersonInCallModel {
  String name;
  String surname;
  String imagePath; // şu an daha videocall backend hazır olmadığı için geçici olarak fotoğrafları kullandım
  bool isCamOn;
  bool isMicOn;
  PersonInCallModel({
    required this.name,
    required this.surname,
    required this.imagePath,
    required this.isMicOn,
    required this.isCamOn,
  });
}
