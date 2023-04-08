// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p_public_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPublicProfile _$PPublicProfileFromJson(Map<String, dynamic> json) =>
    PPublicProfile(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$PPublicProfileToJson(PPublicProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
