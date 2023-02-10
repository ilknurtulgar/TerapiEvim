// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveGroup _$ActiveGroupFromJson(Map<String, dynamic> json) => ActiveGroup(
      id: json['id'] as String?,
      groupName: json['groupName'] as String?,
      therapistName: json['therapistName'] as String?,
      advisorName: json['advisorName'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ActiveGroupToJson(ActiveGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'therapistName': instance.therapistName,
      'advisorName': instance.advisorName,
      'date': instance.date,
    };
