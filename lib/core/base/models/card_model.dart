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

CardModel cardModelhome = CardModel(
    subtitle: "Uzman Psikolog",
    imagePath: "assets/images/doctorfotosu.jpeg",
    title: "Günay Kara");
