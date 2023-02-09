// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joinable_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinableGroupModel _$JoinableGroupModelFromJson(Map<String, dynamic> json) =>
    JoinableGroupModel(
      groupName: json['groupName'] as String?,
      therapistName: json['therapistName'] as String?,
      therapistUrl: json['therapistUrl'] as String?,
      advisorName: json['advisorName'] as String?,
      advisorUrl: json['advisorUrl'] as String?,
      participantNumber: json['participantNumber'] as int?,
      sessionNumber: json['sessionNumber'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$JoinableGroupModelToJson(JoinableGroupModel instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'therapistName': instance.therapistName,
      'therapistUrl': instance.therapistUrl,
      'advisorName': instance.advisorName,
      'advisorUrl': instance.advisorUrl,
      'participantNumber': instance.participantNumber,
      'sessionNumber': instance.sessionNumber,
      'id': instance.id,
    };
