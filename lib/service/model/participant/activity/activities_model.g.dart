// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitiesModel _$ActivitiesModelFromJson(Map<String, dynamic> json) =>
    ActivitiesModel(
      title: json['title'] as String?,
      therapist: json['therapist'] as String?,
      time: json['time'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ActivitiesModelToJson(ActivitiesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'therapist': instance.therapist,
      'time': instance.time,
      'id': instance.id,
    };
