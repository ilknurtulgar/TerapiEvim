// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TSessionModel _$TSessionModelFromJson(Map<String, dynamic> json) =>
    TSessionModel(
      id: json['id'] as String?,
      meetingId: json['meetingId'] as String?,
      participantId: json['participantId'] as String?,
      participantName: json['participantName'] as String?,
      isFinished: json['isFinished'] as bool?,
      therapistId: json['therapistId'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      freeDateId: json['freeDateId'] as String?,
      isGroupCategorySet: json['isGroupCategorySet'] as bool?,
    );

Map<String, dynamic> _$TSessionModelToJson(TSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'freeDateId': instance.freeDateId,
      'therapistId': instance.therapistId,
      'participantName': instance.participantName,
      'meetingId': instance.meetingId,
      'isFinished': instance.isFinished,
      'isGroupCategorySet': instance.isGroupCategorySet,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
