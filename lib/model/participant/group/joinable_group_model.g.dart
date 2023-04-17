// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joinable_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinableGroupModel _$JoinableGroupModelFromJson(Map<String, dynamic> json) =>
    JoinableGroupModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      therapistId: json['therapistId'] as String?,
      therapistName: json['therapistName'] as String?,
      therapistImageUrl: json['therapistImageUrl'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      therapistHelperName: json['therapistHelperName'] as String?,
      therapistHelperImageUrl: json['therapistHelperImageUrl'] as String?,
      participantNumber: json['participantNumber'] as String?,
      numberOfSessions: json['numberOfSessions'] as String?,
      numberOfWeeks: json['numberOfWeeks'] as String?,
    );

Map<String, dynamic> _$JoinableGroupModelToJson(JoinableGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'therapistId': instance.therapistId,
      'therapistName': instance.therapistName,
      'therapistImageUrl': instance.therapistImageUrl,
      'therapistHelperId': instance.therapistHelperId,
      'therapistHelperName': instance.therapistHelperName,
      'therapistHelperImageUrl': instance.therapistHelperImageUrl,
      'participantNumber': instance.participantNumber,
      'numberOfSessions': instance.numberOfSessions,
      'numberOfWeeks': instance.numberOfWeeks,
    };
