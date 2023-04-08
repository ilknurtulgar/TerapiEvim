// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_about_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TAboutGroupModel _$TAboutGroupModelFromJson(Map<String, dynamic> json) =>
    TAboutGroupModel(
      id: json['id'] as String?,
      groupName: json['groupName'] as String?,
      therapistId: json['therapistId'] as String?,
      therapistName: json['therapistName'] as String?,
      aboutTherapist: json['aboutTherapist'] as String?,
      therapistImageUrl: json['therapistImageUrl'] as String?,
      listOfHelpingGroups: (json['listOfHelpingGroups'] as List<dynamic>?)
          ?.map((e) => TGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TAboutGroupModelToJson(TAboutGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'therapistId': instance.therapistId,
      'therapistName': instance.therapistName,
      'aboutTherapist': instance.aboutTherapist,
      'therapistImageUrl': instance.therapistImageUrl,
      'listOfHelpingGroups': instance.listOfHelpingGroups,
    };
