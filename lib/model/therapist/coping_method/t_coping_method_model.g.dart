// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_coping_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TCopingMethodModel _$TCopingMethodModelFromJson(Map<String, dynamic> json) =>
    TCopingMethodModel(
      id: json['id'] as String?,
      therapistId: json['therapistId'] as String?,
      therapistName: json['therapistName'] as String?,
      therapistAvatarUrl: json['therapistAvatarUrl'] as String?,
      description: json['description'] as String?,
      docUrl: json['docUrl'] as String?,
    )..dateTime =
        TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?);

Map<String, dynamic> _$TCopingMethodModelToJson(TCopingMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'therapistName': instance.therapistName,
      'therapistAvatarUrl': instance.therapistAvatarUrl,
      'description': instance.description,
      'docUrl': instance.docUrl,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
