// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_group_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TGroupSessionModel _$TGroupSessionModelFromJson(Map<String, dynamic> json) =>
    TGroupSessionModel(
      id: json['id'] as String?,
      groupId: json['groupId'] as String?,
      meetingId: json['meetingId'] as String?,
      therapistId: json['therapistId'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      therapistHelperName: json['therapistHelperName'] as String?,
      therapistName: json['therapistName'] as String?,
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      isFinished: json['isFinished'] as bool?,
    );

Map<String, dynamic> _$TGroupSessionModelToJson(TGroupSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'therapistId': instance.therapistId,
      'therapistHelperId': instance.therapistHelperId,
      'meetingId': instance.meetingId,
      'therapistHelperName': instance.therapistHelperName,
      'therapistName': instance.therapistName,
      'isFinished': instance.isFinished,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
