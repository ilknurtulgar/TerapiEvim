// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortCallModel _$ShortCallModelFromJson(Map<String, dynamic> json) =>
    ShortCallModel(
      callerId: json['callerId'] as String?,
      calleeId: json['calleeId'] as String?,
      roomId: json['roomId'] as String?,
    );

Map<String, dynamic> _$ShortCallModelToJson(ShortCallModel instance) =>
    <String, dynamic>{
      'callerId': instance.callerId,
      'calleeId': instance.calleeId,
      'roomId': instance.roomId,
    };
