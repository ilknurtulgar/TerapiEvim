// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TGroupModel _$TGroupModelFromJson(Map<String, dynamic> json) => TGroupModel(
      id: json['id'] as String?,
      groupCategory: json['groupCategory'] as String?,
      therapistId: json['therapistId'] as String?,
      name: json['name'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      therapistHelperName: json['therapistHelperName'] as String?,
      hasHelperTherapistAccepted: json['hasHelperTherapistAccepted'] as bool?,
      participantsId: (json['participantsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dateTime:
          TimeStampConverter.timestampFromJson(json['dateTime'] as Timestamp?),
      numberOfWeeks: json['numberOfWeeks'] as int?,
      numberOfSessions: json['numberOfSessions'] as int?,
    );

Map<String, dynamic> _$TGroupModelToJson(TGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'name': instance.name,
      'groupCategory': instance.groupCategory,
      'therapistHelperId': instance.therapistHelperId,
      'therapistHelperName': instance.therapistHelperName,
      'hasHelperTherapistAccepted': instance.hasHelperTherapistAccepted,
      'numberOfWeeks': instance.numberOfWeeks,
      'numberOfSessions': instance.numberOfSessions,
      'participantsId': instance.participantsId,
      'dateTime': TimeStampConverter.timestampToJson(instance.dateTime),
    };
