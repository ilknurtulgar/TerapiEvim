// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_initial_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TInitialData _$TInitialDataFromJson(Map<String, dynamic> json) => TInitialData(
      isTherapistConfirmed: json['isTherapistConfirmed'] as bool?,
      isTherapistBeingReviewed: json['isTherapistBeingReviewed'] as bool?,
      isBeingAdvisorAccepted: json['isBeingAdvisorAccepted'] as bool?,
      maxNumberOfHelpingGroups: json['maxNumberOfHelpingGroups'] as int?,
    );

Map<String, dynamic> _$TInitialDataToJson(TInitialData instance) =>
    <String, dynamic>{
      'isTherapistConfirmed': instance.isTherapistConfirmed,
      'isTherapistBeingReviewed': instance.isTherapistBeingReviewed,
      'isBeingAdvisorAccepted': instance.isBeingAdvisorAccepted,
      'maxNumberOfHelpingGroups': instance.maxNumberOfHelpingGroups,
    };
