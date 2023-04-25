import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'participant_group_call_model.g.dart';

@JsonSerializable()
class ParticipantGroupCallModel extends INetworkModel<ParticipantGroupCallModel> {
  String? participantId, meetingId;
  bool? canCamBeEnabled, canMicBeEnabled, isParticipantKicked;

  ParticipantGroupCallModel({
    this.participantId,
    this.meetingId,
    this.canCamBeEnabled,
    this.canMicBeEnabled,
    this.isParticipantKicked,
  });

  @override
  ParticipantGroupCallModel fromJson(Map<String, dynamic> json) =>
      ParticipantGroupCallModel.fromJson(json);

  factory ParticipantGroupCallModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantGroupCallModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ParticipantGroupCallModelToJson(this);
}
