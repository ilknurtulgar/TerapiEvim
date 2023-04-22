// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_free_hours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TFreeHoursModel _$TFreeHoursModelFromJson(Map<String, dynamic> json) =>
    TFreeHoursModel(
      id: json['id'] as String?,
      hour: json['hour'] as String?,
      isFree: json['isFree'] as bool?,
      participantId: json['participantId'] as String?,
      therapistId: json['therapistId'] as String?,
      freeDateId: json['freeDateId'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
    );

Map<String, dynamic> _$TFreeHoursModelToJson(TFreeHoursModel instance) =>
    <String, dynamic>{
      'isFree': instance.isFree,
      'id': instance.id,
      'participantId': instance.participantId,
      'therapistId': instance.therapistId,
      'freeDateId': instance.freeDateId,
      'hour': instance.hour,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
