// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TSessionModel _$TSessionModelFromJson(Map<String, dynamic> json) =>
    TSessionModel(
      id: json['id'] as String?,
      participantId: json['participantId'] as String?,
      participantName: json['participantName'] as String?,
      isFinished: json['isFinished'] as bool?,
    )..dateTime =
        TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?);

Map<String, dynamic> _$TSessionModelToJson(TSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'participantName': instance.participantName,
      'isFinished': instance.isFinished,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
