// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_initial_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TInitialData _$TInitialDataFromJson(Map<String, dynamic> json) => TInitialData(
      isTherapistConfirmed: json['isTherapistConfirmed'] as bool?,
    )..isTherapistBeingReviewed = json['isTherapistBeingReviewed'] as bool?;

Map<String, dynamic> _$TInitialDataToJson(TInitialData instance) =>
    <String, dynamic>{
      'isTherapistConfirmed': instance.isTherapistConfirmed,
      'isTherapistBeingReviewed': instance.isTherapistBeingReviewed,
    };
