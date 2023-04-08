// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_seminar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TSeminarModel _$TSeminarModelFromJson(Map<String, dynamic> json) =>
    TSeminarModel(
      id: json['id'] as String?,
      therapistId: json['therapistId'] as String?,
      name: json['name'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      therapistHelperName: json['therapistHelperName'] as String?,
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
    );

Map<String, dynamic> _$TSeminarModelToJson(TSeminarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'name': instance.name,
      'therapistHelperId': instance.therapistHelperId,
      'therapistHelperName': instance.therapistHelperName,
      'participantsId': instance.participantsId,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
