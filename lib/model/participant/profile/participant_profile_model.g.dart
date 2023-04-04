// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantProfileModel _$ParticipantProfileModelFromJson(
        Map<String, dynamic> json) =>
    ParticipantProfileModel(
      participantName: json['participantName'] as String?,
      participantUrl: json['participantUrl'] as String?,
      birthday: json['birthday'] as String?,
      activeGroup: json['activeGroup'] == null
          ? null
          : ActiveGroup.fromJson(json['activeGroup'] as Map<String, dynamic>),
      browsed: (json['browsed'] as List<dynamic>?)
          ?.map((e) => Browsed.fromJson(e as Map<String, dynamic>))
          .toList(),
      joinedActivity: (json['joinedActivity'] as List<dynamic>?)
          ?.map((e) => JoinedActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParticipantProfileModelToJson(
        ParticipantProfileModel instance) =>
    <String, dynamic>{
      'participantName': instance.participantName,
      'participantUrl': instance.participantUrl,
      'birthday': instance.birthday,
      'activeGroup': instance.activeGroup,
      'browsed': instance.browsed,
      'joinedActivity': instance.joinedActivity,
    };
