// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participants _$ParticipantsFromJson(Map<String, dynamic> json) => Participants(
      userId: json['userId'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$ParticipantsToJson(Participants instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'avatarUrl': instance.avatarUrl,
      'username': instance.username,
    };
