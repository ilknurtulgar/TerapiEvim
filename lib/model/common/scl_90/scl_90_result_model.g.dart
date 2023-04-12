// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scl_90_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scl90ResultModel _$Scl90ResultModelFromJson(Map<String, dynamic> json) =>
    Scl90ResultModel(
      id: json['id'] as String?,
      participantId: json['participantId'] as String?,
      somatization: (json['somatization'] as num?)?.toDouble(),
      oKB: (json['oKB'] as num?)?.toDouble(),
      interpersonalSensitivity:
          (json['interpersonalSensitivity'] as num?)?.toDouble(),
      depression: (json['depression'] as num?)?.toDouble(),
      anxiety: (json['anxiety'] as num?)?.toDouble(),
      angerEnmity: (json['angerEnmity'] as num?)?.toDouble(),
      phobicAnxiety: (json['phobicAnxiety'] as num?)?.toDouble(),
      paranoidThought: (json['paranoidThought'] as num?)?.toDouble(),
      psychoticism: (json['psychoticism'] as num?)?.toDouble(),
      additionalScales: (json['additionalScales'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$Scl90ResultModelToJson(Scl90ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'somatization': instance.somatization,
      'oKB': instance.oKB,
      'interpersonalSensitivity': instance.interpersonalSensitivity,
      'depression': instance.depression,
      'anxiety': instance.anxiety,
      'angerEnmity': instance.angerEnmity,
      'phobicAnxiety': instance.phobicAnxiety,
      'paranoidThought': instance.paranoidThought,
      'psychoticism': instance.psychoticism,
      'additionalScales': instance.additionalScales,
      'timestamp': instance.timestamp,
    };
