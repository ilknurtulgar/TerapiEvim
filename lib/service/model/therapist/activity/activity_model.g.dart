// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      therapistId: json['therapistId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTime:
          ActivityModel._timestampFromJson(json['dateTime'] as Timestamp?),
      isFinished: json['isFinished'] as bool?,
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'title': instance.title,
      'description': instance.description,
      'dateTime': ActivityModel._timestampToJson(instance.dateTime),
      'isFinished': instance.isFinished,
      'participantsId': instance.participantsId,
    };
