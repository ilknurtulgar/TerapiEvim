// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TActivityModel _$TActivityModelFromJson(Map<String, dynamic> json) =>
    TActivityModel(
      id: json['id'] as String?,
      therapistId: json['therapistId'] as String?,
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      isFinished: json['isFinished'] as bool?,
      isStarted: json['isStarted'] as bool?,
      meetingId: json['meetingId'] as String?,
      recordUrl: json['recordUrl'] as String?,
    );

Map<String, dynamic> _$TActivityModelToJson(TActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'title': instance.title,
      'description': instance.description,
      'meetingId': instance.meetingId,
      'recordUrl': instance.recordUrl,
      'isFinished': instance.isFinished,
      'isStarted': instance.isStarted,
      'participantsId': instance.participantsId,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
