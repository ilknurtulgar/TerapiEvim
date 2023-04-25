// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_group_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantGroupCallModel _$ParticipantGroupCallModelFromJson(
        Map<String, dynamic> json) =>
    ParticipantGroupCallModel(
      participantId: json['participantId'] as String?,
      meetingId: json['meetingId'] as String?,
      canCamBeEnabled: json['canCamBeEnabled'] as bool?,
      canMicBeEnabled: json['canMicBeEnabled'] as bool?,
      isParticipantKicked: json['isParticipantKicked'] as bool?,
    );

Map<String, dynamic> _$ParticipantGroupCallModelToJson(
        ParticipantGroupCallModel instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'meetingId': instance.meetingId,
      'canCamBeEnabled': instance.canCamBeEnabled,
      'canMicBeEnabled': instance.canMicBeEnabled,
      'isParticipantKicked': instance.isParticipantKicked,
    };
