import 'person_in_call_model.dart';
class VideoCallViewModel {
  double height;
  double width;
  double borderRadius;
  PersonInCallModel person;
  bool isNameShown;
  bool isTherapistInGroupTherapy; // kamera kapandığına baş harfli container hep merkezde oluyor ancak grup terapisi yapılırken terapist kamerasını kapattığında
                                  // aşağıda görünen katılımcılardan dolayı o containerın önü kapanıyor onu biraz daha yukarı almak için bu bool değerini kullandım
  VideoCallViewModel(
      {required this.height,
      required this.width,
      required this.borderRadius,
      required this.person,
      required this.isNameShown,
      required this.isTherapistInGroupTherapy});
}
