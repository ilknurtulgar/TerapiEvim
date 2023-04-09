// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_free_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TFreeDateModel _$TFreeDateModelFromJson(Map<String, dynamic> json) =>
    TFreeDateModel(
      id: json['id'] as String?,
      therapistId: json['therapistId'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      meetId: json['meetId'] as String?,
      hours: (json['hours'] as List<dynamic>?)
              ?.map((e) => TFreeHoursModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TFreeDateModelToJson(TFreeDateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'meetId': instance.meetId,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
