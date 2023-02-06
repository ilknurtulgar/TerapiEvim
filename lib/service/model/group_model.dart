class Group {
  //Therapist yardimci terapist
  //Danisan
  String GroupName;
  String meetingDay;
  String meetingTime;
  //metodlar
  int sessionNumber;

  Group(
      {required this.GroupName,
      required this.meetingDay,
      required this.meetingTime,
      required this.sessionNumber});
//her hafta datetime in guncellenmesi lazim
//katilimci ekle cikar fonksyionlari

  int sessionGetter() {
    return sessionNumber;
  }

  String ConstantMeetingDay() {
    return "Her $meetingDay gunu ,$meetingTime ";
  }
}
