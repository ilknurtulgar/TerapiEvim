// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealing_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealingMethodModel _$DealingMethodModelFromJson(Map<String, dynamic> json) =>
    DealingMethodModel(
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      docUrl: json['docUrl'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DealingMethodModelToJson(DealingMethodModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'date': instance.date,
      'description': instance.description,
      'docUrl': instance.docUrl,
      'id': instance.id,
    };
