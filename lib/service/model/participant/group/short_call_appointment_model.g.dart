// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_call_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortCallAppointmentModel _$ShortCallAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    ShortCallAppointmentModel(
      therapistName: json['therapistName'] as String?,
      therapistUrl: json['therapistUrl'] as String?,
      date: json['date'] as String?,
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShortCallAppointmentModelToJson(
        ShortCallAppointmentModel instance) =>
    <String, dynamic>{
      'therapistName': instance.therapistName,
      'therapistUrl': instance.therapistUrl,
      'date': instance.date,
      'time': instance.time,
      'id': instance.id,
    };
