// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_public_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TPublicProfile _$TPublicProfileFromJson(Map<String, dynamic> json) =>
    TPublicProfile(
      name: json['name'] as String?,
      aboutMe: json['aboutMe'] as String?,
      imageUrl: json['imageUrl'] as String?,
      helpingGroupsId: (json['helpingGroupsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TPublicProfileToJson(TPublicProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aboutMe': instance.aboutMe,
      'imageUrl': instance.imageUrl,
      'helpingGroupsId': instance.helpingGroupsId,
    };
