class CardModel {
  String imagePath;
  String title;
  String? subtitle;
  CardModel({
    required this.imagePath,
    required this.title,
    this.subtitle,
  });
}
