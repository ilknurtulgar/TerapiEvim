class GroupModelInProfilePage {
  String groupName;
  String mainTherapistName;
  List<String> methodTitles; // baş etme metot başlıkları
  String secondTherapistName;
  String therapyTime;
  GroupModelInProfilePage({
    required this.groupName,
    required this.mainTherapistName,
    required this.methodTitles,
    required this.secondTherapistName,
    required this.therapyTime,
  });
}

class SeminarModelInProfilePage {
  String therapistName;
  String seminarTitle;
  SeminarModelInProfilePage({
    required this.therapistName,
    required this.seminarTitle,
  });
}

