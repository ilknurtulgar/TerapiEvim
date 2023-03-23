// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TGroupModel _$TGroupModelFromJson(Map<String, dynamic> json) => TGroupModel(
      groupId: json['groupId'] as String?,
      therapistId: json['therapistId'] as String?,
      name: json['name'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      therapistHelperName: json['therapistHelperName'] as String?,
      hasHelperTherapistAccepted: json['hasHelperTherapistAccepted'] as bool?,
      maxAllowedParticipants: json['maxAllowedParticipants'] as int?,
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      dateTime: TGroupModel._timestampFromJson(json['dateTime'] as Timestamp?),
    );

Map<String, dynamic> _$TGroupModelToJson(TGroupModel instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'therapistId': instance.therapistId,
      'name': instance.name,
      'therapistHelperId': instance.therapistHelperId,
      'therapistHelperName': instance.therapistHelperName,
      'hasHelperTherapistAccepted': instance.hasHelperTherapistAccepted,
      'maxAllowedParticipants': instance.maxAllowedParticipants,
      'participantsId': instance.participantsId,
      'dateTime': TGroupModel._timestampToJson(instance.dateTime),
    };
