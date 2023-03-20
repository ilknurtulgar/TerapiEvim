// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TGroupModel _$TGroupModelFromJson(Map<String, dynamic> json) => TGroupModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      meetingsDate: (json['meetingsDate'] as List<dynamic>?)
          ?.map((e) => MeetingsDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TGroupModelToJson(TGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'therapistHelperId': instance.therapistHelperId,
      'meetingsDate': instance.meetingsDate,
    };
