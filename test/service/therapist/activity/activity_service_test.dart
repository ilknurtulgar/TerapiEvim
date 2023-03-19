import 'package:terapievim/core/init/network/vexa_fire_manager.dart';
import 'package:terapievim/service/service/_therapist/activity/activity_service.dart';
import 'package:terapievim/service/service/_therapist/activity/i_activity_service.dart';

void main() {
  final VexaFireManager vexaFireManager = VexaFireManager.instance;

  IActivityService activityService =
      ActivityService(vexaFireManager.networkManager, '22');

}
