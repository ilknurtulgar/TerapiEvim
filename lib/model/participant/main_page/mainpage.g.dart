// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainpage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mainpage _$MainpageFromJson(Map<String, dynamic> json) => Mainpage(
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      usertitle: json['usertitle'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$MainpageToJson(Mainpage instance) => <String, dynamic>{
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'usertitle': instance.usertitle,
      'description': instance.description,
      'id': instance.id,
    };
