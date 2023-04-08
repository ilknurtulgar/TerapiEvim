// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_initial_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PInitialData _$PInitialDataFromJson(Map<String, dynamic> json) => PInitialData(
      joinedGroupId: json['joinedGroupId'] as String?,
      isJoinedGroupLocked: json['isJoinedGroupLocked'] as String?,
    )
      ..groupCategory = json['groupCategory'] as String?
      ..isTessPassed = json['isTessPassed'] as bool?
      ..isSessionComplete = json['isSessionComplete'] as bool?;

Map<String, dynamic> _$PInitialDataToJson(PInitialData instance) =>
    <String, dynamic>{
      'joinedGroupId': instance.joinedGroupId,
      'isJoinedGroupLocked': instance.isJoinedGroupLocked,
      'groupCategory': instance.groupCategory,
      'isTessPassed': instance.isTessPassed,
      'isSessionComplete': instance.isSessionComplete,
    };
