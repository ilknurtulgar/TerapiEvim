import 'package:flutter/material.dart';
import 'package:terapievim/screen/group/ui/my_group.dart';

import '../../component/lock_screen_components.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const MyGroup(),
        Container(
          color: Colors.black.withOpacity(0.8),
        ),
        const PopUp()
      ],
    );
  }
}
