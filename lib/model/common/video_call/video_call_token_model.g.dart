// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCallTokenModel _$VideoCallTokenModelFromJson(Map<String, dynamic> json) =>
    VideoCallTokenModel(
      meetingId: json['meetingId'] as String,
      token: json['token'] as String,
      therapistHelperId: json['therapistHelperId'] as String? ?? '',
      participantId: json['participantId'] as String,
      isTherapist: json['isTherapist'] as bool,
      isMainTherapist: json['isMainTherapist'] as bool? ?? false,
    );

Map<String, dynamic> _$VideoCallTokenModelToJson(
        VideoCallTokenModel instance) =>
    <String, dynamic>{
      'meetingId': instance.meetingId,
      'token': instance.token,
      'participantId': instance.participantId,
      'therapistHelperId': instance.therapistHelperId,
      'isTherapist': instance.isTherapist,
      'isMainTherapist': instance.isMainTherapist,
    };
