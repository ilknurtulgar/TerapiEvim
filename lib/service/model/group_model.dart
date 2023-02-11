class Group {
  //Therapist yardimci terapist
  //Danisan
  String groupName;
  String meetingDay;
  String meetingTime;
  //metodlar
  int sessionNumber;

  Group(
      {required this.groupName,
      required this.meetingDay,
      required this.meetingTime,
      required this.sessionNumber});
//her hafta datetime in guncellenmesi lazim
//katilimci ekle cikar fonksyionlari

  int sessionGetter() {
    return sessionNumber;
  }

  String constantMeetingDay() {
    return "Her $meetingDay gunu ,$meetingTime ";
  }
}
