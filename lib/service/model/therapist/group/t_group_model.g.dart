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
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
    );

Map<String, dynamic> _$TGroupModelToJson(TGroupModel instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'therapistId': instance.therapistId,
      'name': instance.name,
      'therapistHelperId': instance.therapistHelperId,
      'therapistHelperName': instance.therapistHelperName,
      'hasHelperTherapistAccepted': instance.hasHelperTherapistAccepted,
      'participantsId': instance.participantsId,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
