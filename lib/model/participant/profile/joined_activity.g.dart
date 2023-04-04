// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedActivity _$JoinedActivityFromJson(Map<String, dynamic> json) =>
    JoinedActivity(
      id: json['id'] as String?,
      therapistName: json['therapistName'] as String?,
      activityTitle: json['activityTitle'] as String?,
    );

Map<String, dynamic> _$JoinedActivityToJson(JoinedActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistName': instance.therapistName,
      'activityTitle': instance.activityTitle,
    };
