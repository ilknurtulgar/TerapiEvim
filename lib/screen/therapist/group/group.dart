import 'package:flutter/material.dart';
import 'package:terapievim/screen/therapist/group/therapist_about.dart';

class TherapistGroupPage extends StatelessWidget {
  const TherapistGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TherapistProfile(
      isSecTherapist: true,
    );
  }
}
