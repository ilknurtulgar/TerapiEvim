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
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$TActivityModelToJson(TActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'title': instance.title,
      'description': instance.description,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
      'isFinished': instance.isFinished,
      'participantsId': instance.participantsId,
    };
