// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCallModel _$VideoCallModelFromJson(Map<String, dynamic> json) =>
    VideoCallModel(
      therapistId: json['therapistId'] as String?,
      therapistName: json['therapistName'] as String?,
      advisorId: json['advisorId'] as String?,
      advisorName: json['advisorName'] as String?,
      roomId: json['roomId'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Participants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoCallModelToJson(VideoCallModel instance) =>
    <String, dynamic>{
      'therapistId': instance.therapistId,
      'therapistName': instance.therapistName,
      'advisorId': instance.advisorId,
      'advisorName': instance.advisorName,
      'roomId': instance.roomId,
      'participants': instance.participants,
    };
