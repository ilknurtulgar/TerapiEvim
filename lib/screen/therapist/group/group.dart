import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:terapievim/screen/participant/group/my_group.dart';
import 'package:terapievim/screen/therapist/group/group_add/group_add_view.dart';
import 'package:terapievim/screen/therapist/group/my_groups_view.dart';

class TherapistGroupPage extends StatelessWidget {
  const TherapistGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupAddView();
  }
}
