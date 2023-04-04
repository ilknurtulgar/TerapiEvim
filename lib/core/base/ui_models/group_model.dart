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

class SeminarModelInProfileView {
  String therapistName;
  String seminarTitle;
  SeminarModelInProfileView({
    required this.therapistName,
    required this.seminarTitle,
  });
}
