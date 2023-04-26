import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'therapist_helper_group_call_model.g.dart';

@JsonSerializable()
class TherapistHelperGroupCallModel
    extends INetworkModel<TherapistHelperGroupCallModel> {
  String? therapistHelperId, meetingId;
  bool? hasTherapistHelperControl, isTherapistSendToIsolatedCall;

  TherapistHelperGroupCallModel({
    this.meetingId,
    this.therapistHelperId,
    this.hasTherapistHelperControl,
    this.isTherapistSendToIsolatedCall,
  });

  @override
  TherapistHelperGroupCallModel fromJson(Map<String, dynamic> json) =>
      TherapistHelperGroupCallModel.fromJson(json);

  factory TherapistHelperGroupCallModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistHelperGroupCallModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TherapistHelperGroupCallModelToJson(this);
}
