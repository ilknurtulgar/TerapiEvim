// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_coping_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TCopingMethodModel _$TCopingMethodModelFromJson(Map<String, dynamic> json) =>
    TCopingMethodModel(
      id: json['id'] as String?,
      therapistId: json['therapistId'] as String?,
      groupId: json['groupId'] as String?,
      groupName: json['groupName'] as String?,
      therapistName: json['therapistName'] as String?,
      therapistAvatarUrl: json['therapistAvatarUrl'] as String?,
      description: json['description'] as String?,
      docUrl: json['docUrl'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TCopingMethodModelToJson(TCopingMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'groupName': instance.groupName,
      'therapistId': instance.therapistId,
      'groupId': instance.groupId,
      'therapistName': instance.therapistName,
      'therapistAvatarUrl': instance.therapistAvatarUrl,
      'description': instance.description,
      'docUrl': instance.docUrl,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
