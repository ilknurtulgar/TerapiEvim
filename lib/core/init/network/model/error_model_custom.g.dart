// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model_custom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModelCustom _$ErrorModelCustomFromJson(Map<String, dynamic> json) =>
    ErrorModelCustom(
      statusCode: json['statusCode'] as int?,
      message: json['message'],
    );

Map<String, dynamic> _$ErrorModelCustomToJson(ErrorModelCustom instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
