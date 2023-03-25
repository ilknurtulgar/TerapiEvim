// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TActivityModel _$TActivityModelFromJson(Map<String, dynamic> json) =>
    TActivityModel(
      therapistId: json['therapistId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      isFinished: json['isFinished'] as bool?,
      isStarted: json['isStarted'] as bool?,
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roomId: json['roomId'] as String?,
      recordUrl: json['recordUrl'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$TActivityModelToJson(TActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'title': instance.title,
      'description': instance.description,
      'roomId': instance.roomId,
      'recordUrl': instance.recordUrl,
      'isFinished': instance.isFinished,
      'isStarted': instance.isStarted,
      'participantsId': instance.participantsId,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
