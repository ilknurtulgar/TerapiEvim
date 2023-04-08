// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_join_video_call_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TJoinVideoCallResultModel _$TJoinVideoCallResultModelFromJson(
        Map<String, dynamic> json) =>
    TJoinVideoCallResultModel(
      id: json['id'] as String?,
      participantId: json['participantId'] as String?,
      participantName: json['participantName'] as String?,
    );

Map<String, dynamic> _$TJoinVideoCallResultModelToJson(
        TJoinVideoCallResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'participantName': instance.participantName,
    };
