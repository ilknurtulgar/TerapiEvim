// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCallTokenModel _$VideoCallTokenModelFromJson(Map<String, dynamic> json) =>
    VideoCallTokenModel(
      meetingId: json['meetingId'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$VideoCallTokenModelToJson(
        VideoCallTokenModel instance) =>
    <String, dynamic>{
      'meetingId': instance.meetingId,
      'token': instance.token,
    };
