// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_initial_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PInitialData _$PInitialDataFromJson(Map<String, dynamic> json) => PInitialData(
      joinedGroupId: json['joinedGroupId'] as String?,
      shortCallSessionId: json['shortCallSessionId'] as String?,
      isJoinedGroupLocked: json['isJoinedGroupLocked'] as bool?,
      groupCategory: json['groupCategory'] as String?,
      isScl90Submitted: json['isScl90Submitted'] as bool?,
      isSessionComplete: json['isSessionComplete'] as bool?,
      isTestResultReady: json['isTestResultReady'] as bool?,
      isSessionSelected: json['isSessionSelected'] as bool?,
    );

Map<String, dynamic> _$PInitialDataToJson(PInitialData instance) =>
    <String, dynamic>{
      'joinedGroupId': instance.joinedGroupId,
      'shortCallSessionId': instance.shortCallSessionId,
      'isJoinedGroupLocked': instance.isJoinedGroupLocked,
      'groupCategory': instance.groupCategory,
      'isScl90Submitted': instance.isScl90Submitted,
      'isSessionComplete': instance.isSessionComplete,
      'isTestResultReady': instance.isTestResultReady,
      'isSessionSelected': instance.isSessionSelected,
    };
