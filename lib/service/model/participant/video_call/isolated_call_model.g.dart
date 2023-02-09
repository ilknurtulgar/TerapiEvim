// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isolated_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsolatedCallModel _$IsolatedCallModelFromJson(Map<String, dynamic> json) =>
    IsolatedCallModel(
      advisorId: json['advisorId'] as String?,
      advisorName: json['advisorName'] as String?,
      roomId: json['roomId'] as String?,
      participantId: json['participantId'] as String?,
      participantName: json['participantName'] as String?,
    );

Map<String, dynamic> _$IsolatedCallModelToJson(IsolatedCallModel instance) =>
    <String, dynamic>{
      'advisorId': instance.advisorId,
      'advisorName': instance.advisorName,
      'roomId': instance.roomId,
      'participantId': instance.participantId,
      'participantName': instance.participantName,
    };
