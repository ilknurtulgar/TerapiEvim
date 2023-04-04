// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approaching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Approaching _$ApproachingFromJson(Map<String, dynamic> json) => Approaching(
      therapist: json['therapist'] as String?,
      therapistId: json['therapistId'] as String?,
      advisor: json['advisor'] as String?,
      advisorId: json['advisorId'] as String?,
      time: json['time'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ApproachingToJson(Approaching instance) =>
    <String, dynamic>{
      'therapist': instance.therapist,
      'therapistId': instance.therapistId,
      'advisor': instance.advisor,
      'advisorId': instance.advisorId,
      'time': instance.time,
      'id': instance.id,
    };
