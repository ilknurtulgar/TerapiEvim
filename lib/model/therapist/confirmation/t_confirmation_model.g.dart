// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_confirmation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmationModel _$ConfirmationModelFromJson(Map<String, dynamic> json) =>
    ConfirmationModel(
      id: json['id'] as String?,
      therapistId: json['therapistId'] as String?,
      uploadedPdfUrl: json['uploadedPdfUrl'] as String?,
      isConfirmed: json['isConfirmed'] as String?,
    );

Map<String, dynamic> _$ConfirmationModelToJson(ConfirmationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'therapistId': instance.therapistId,
      'uploadedPdfUrl': instance.uploadedPdfUrl,
      'isConfirmed': instance.isConfirmed,
    };
