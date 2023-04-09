// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_free_hours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TFreeHoursModel _$TFreeHoursModelFromJson(Map<String, dynamic> json) =>
    TFreeHoursModel(
      hour: TimeStampConverter.timestampFromJson(json['hour'] as Timestamp?),
      isFree: json['isFree'] as bool?,
      participantId: json['participantId'] as String?,
    );

Map<String, dynamic> _$TFreeHoursModelToJson(TFreeHoursModel instance) =>
    <String, dynamic>{
      'isFree': instance.isFree,
      'participantId': instance.participantId,
      'hour': TimeStampConverter.timestampToJson(instance.hour),
    };
