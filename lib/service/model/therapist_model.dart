//therapist

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Therapist {
  String namesurnameT;
  String birthdayT;
  String emailT;
  String numberT;
  String passwordT;
  String edevletpdf;
  String about;
  String therapistarea;
  String metot;
  String seminar;
  String messagge;
  String subtitle;

  Therapist(
      {required this.birthdayT,
      required this.subtitle,
      required this.emailT,
      required this.namesurnameT,
      required this.numberT,
      required this.metot,
      required this.passwordT,
      required this.about,
      required this.edevletpdf,
      required this.messagge,
      required this.seminar,
      required this.therapistarea});
}
