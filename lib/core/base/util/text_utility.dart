//buraya sadece uygulamada fix duracak olan textler konacaktir

class GroupTextUtil {
  //lockscreen

  static String groupPageText = "Grup Sayfası";
  static String confirmationText = "Belgeniz onaylandı devam edebilirsiniz.";
  static String lockScreenWarningText =
      "Terapist Onaylanmasi Gerçekletirilmeden Devam Edilemez";
  static String confirmText = "Onayla";
  static String confirmingText = "Onaylama";
  static String whyConfirmingText =
      "Neden onaylama yapmasını bildiren yazı"; //degistirilecek
  static String pdfUploadingText =
      "E-Devlet Onaylı Mezuniyet Belgenizi Yükleyiniz (.pdf desteklenmektedir)";
  static String uploadText = "Yükle";
  //group add

  static String monday = "Pazartesi";
  static String tuesday = "Salı";
  static String wednesday = "Carsamba";
  static String thursday = "Perşembe";
  static String friday = "Cuma";
  static String saturday = "Cumartesi";
  static String sunday = "Pazar";
  static String addGroupText = "Grup Ekle";
  static String groupNameText = "Grup İsmi";
  static String secondTherapistText = "Yardımcı Psikolog  ";
  static String meetDayText = "Görüşme Tarihi";
  static String dayText = "Gün";
  static String timeText = "Saat";
  static String createGroupText = "Grup Oluştur";
  static String newSecTherapistText = "Bana Psikolog Bul";
  static String secTherDialogText1 =
      "    kişisine yardımcı psikolog teklifi göndermek istediğinize emin misiniz?";
  static String secTherDialogText2 =
      'İstek gönderildikten itibaren geri dönüt alınmadan başka bir yardımcı terapiste istekte bulunulamaz.';
  static String cancelText = "İptal";
  static String sendRequestText = 'İstek Gonder';

  //groupinformation

  static String upcomingMeetingText = "Yaklaşan Toplantı";
  static String groupsInformationText = "Grubun Bilgileri";
  static String participantsText = "Katılımcılar";
  static String startText = "Başlat";
  static String deleteGroupConfirmText =
      "Grubu Silmek İstediğinize Emin Misiniz? ";
  static String deleteGroupWarningText = 'Silinen gruplar geri getirilemez.';
  static String deleteText = "Sil";
  static String deleteParticipantText =
      "   kişisini gruptan çıkarmak istediğinize emin misiniz?";
  static String myGroupsText = "Gruplarım";

  //new metot

  static String shareOtherGroupsText = "Ayrıca Şu Gruplarda da paylaş";
  static String metotText = "Başetme Metodu";
  static String deleteMetotText =
      "Başetme Metodunu Silmek İstediğinize Emin Misiniz? ";
  static String deleteMetotWarningText = 'Verileriniz Kaydedilmeyecektir.';
  static String sendMessageText = "Mesaj Gönder";
  static String secTherapistGroupsText =
      "Yardımcı Psikologluk Yaptığı Diğer Gruplar";

  //participantTexts

  static const String groupOutHeading =
      "Gruptan çıkmak istediğinize emin misin? ";
  static const String groupOutText =
      " Eminseniz Grup Kategori sayfası yeniden seçim yapmanız için açılacaktır.";
  static const String groupCategoriesHeading = "Katılabileceğiniz Gruplar";
  static const String shortCallDateChooseText =
      "Size Uygun Tarih ve Saat Seçiniz.";
  static const String terapiEvim = "TerapiEvim";
  static const String yes = "Evet";
  static const String myGroupText = "Grubum";
}

class MessageTextUtil {
  static const String messageapptext = "Mesajlar";
  static const String searchtext = "Ara";
}

class LoginSignUpTextUtil {
  static String login = 'Giriş Yap';
  static String signUp = 'Kaydol';
  static String forgotYourPassword = 'Şifreni mi unuttun?';
  static String orText = 'Ya da';
  static String therapistAcceptedMakingShortCall =
      '''15 dakikalık terapiyi sırayla yapmayı kabul
ediyorum.KVKK kabul ediyorum.''';
  // before login page
  static String whoAreYou = '''Kim olarak uygulamaya devam
etmek istersiniz?''';
  static String homeImagePath = 'assets/images/home.jpg';
  static String participant = 'Danışan';
  static String therapist = 'Psikolog';
  static String appName = 'Terapi Evim';
  static String welcome = 'Hoşgeldiniz';
}

class ParticipantProfileTextUtil {
  static String myActiveGroup = 'Aktif Grubum';
  static String lastRead = 'En Son Incelediklerim';
  static String joinedSeminars = 'Katıldığım Seminerler';
  static String mainTherpist = 'Ana psikolog: ';
  static String advisor = 'Yardımcı Psikolog: ';
  static String readAgain = 'Tekrar Oku';
  static String watchAgain = 'Tekrar izle';
}

class ProfileSettingsTextUtil {
  static List<String> informationTitle = [
    'Ad Soyad: ',
    'Doğum Tarihi: ',
    'Cinsiyet: ',
    'Mail: ',
    'Şifre: ',
    'Telefon: '
  ];
  static String save = 'Kaydet';
  static String therapistAcceptedRandomTherapistList =
      '''Random yardımcı psikolog listesinde
bulunmak istiyorum.''';
  static String numberOfGroups = '''Yardımcı psikologluk yapabileceğim
grup sayısı''';
}

class TherapistProfileTextUtil {
  static String aboutMe = 'Hakkımda';
  static String myGroups = 'Gruplarım';
  static String methods = 'Metotlar';
  static String seminars = 'Seminerler';
  static String view = 'incele';
  static String watch = 'izle';
  static String advisor = 'Yardımcı Psikolog: ';
  static List<String> genderList = ['Kadın', 'Erkek'];
}

class ActivityTextUtil {
  static String add = "Ekle";
  static String share = "Paylaş";
  static String join = "Katıl";
  static String watchTheRecording = "Kaydı İzle";
  static String myupcomingActivities = "Yaklaşan Aktivitelerim";
  static String upcomingActivities = "Yaklaşan Aktiviteler";
  static String pastActivities = "Geçmiş Aktiviteler";
  static String otherUpComingActivities = "Yaklaşan Diğer Aktiviteler";
  static String start = "Başla";
  static String myPastActivities = "Geçmiş Aktivitelerim";
  static String otherPastActivities = "Geçmiş Diğer Aktiviteler";
  static String activityUpdate = "Aktivite Güncelleme";
  static String newActivity = "Yeni Aktivite";
  static String eventName = "Etkinlik İsmi";
  static String eventAbout = "Etkinlik Hakkında";
  static String date = "Tarih";
  static String clock = "Saat";
  static String update = "Güncelle";
  static String create = "Oluştur";
  static const String addNewClock = "Yeni Saat Ekleme ";
  static const String addClock = "Saat Ekle";
  static const String clocks = "Saatler";
  static const String save = "Kaydet";
  static const String filtering = "Filtreleme";
  static const String clean = "Temizle";
  static const String psychologist = "Psikolog";
  static const String issue = "Konu";
  static const String seminars = "Seminerleri";
  static const String searchText = "Ne aramıştınız";
  static const String updateMyInformation = "Bilgilerimi Güncelle";
}

class HomeTextUtil {
  static const myAvailableHours = "Müsaait Olduğum Saatler";
  static const String notification = "Bildirim";
  static const String reminder = "Hatirlatma";
  static const String shortCall = "15 Dakikalik Seans";
  static const String event = "Etkinlik";
  static const String therapy = "Grup Terapisi";
  static const String clientTwoDots = "Danisan: ";
  static const String activityName = "Etkinlik Ismi:";
  static const String therapyNameTwoDots = "Grup:";
  static const String timeTwoDots = "Saat:";
  static const String welcome = "Hoşgeldiniz";
  static const String myMinuteSessions = "15 DAKİKALIK SEANSLARIM";
  static const String copingMethods = "BAŞ ETME METOTLARI";
  static const String readMethod = "Metotu Oku";
  static const String detail = "Detaylar";
}
