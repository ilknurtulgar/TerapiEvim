// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_free_hours_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TFreeHoursModel _$TFreeHoursModelFromJson(Map<String, dynamic> json) =>
    TFreeHoursModel(
      hour: json['hour'] as String?,
      isFree: json['isFree'] as bool?,
      participantId: json['participantId'] as String?,
      freeDateId: json['freeDateId'] as String?,
    );

Map<String, dynamic> _$TFreeHoursModelToJson(TFreeHoursModel instance) =>
    <String, dynamic>{
      'isFree': instance.isFree,
      'participantId': instance.participantId,
      'freeDateId': instance.freeDateId,
      'hour': instance.hour,
    };
