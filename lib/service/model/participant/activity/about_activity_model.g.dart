// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutActivityModel _$AboutActivityModelFromJson(Map<String, dynamic> json) =>
    AboutActivityModel(
      therapistName: json['therapistName'] as String?,
      therapistId: json['therapistId'] as String?,
      therapistUrl: json['therapistUrl'] as String?,
      aboutTherapist: json['aboutTherapist'] as String?,
      activityName: json['activityName'] as String?,
      aboutActivity: json['aboutActivity'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$AboutActivityModelToJson(AboutActivityModel instance) =>
    <String, dynamic>{
      'therapistName': instance.therapistName,
      'therapistId': instance.therapistId,
      'therapistUrl': instance.therapistUrl,
      'aboutTherapist': instance.aboutTherapist,
      'activityName': instance.activityName,
      'aboutActivity': instance.aboutActivity,
      'date': instance.date,
    };
