// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_helper_group_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistHelperGroupCallModel _$TherapistHelperGroupCallModelFromJson(
        Map<String, dynamic> json) =>
    TherapistHelperGroupCallModel(
      meetingId: json['meetingId'] as String?,
      therapistHelperId: json['therapistHelperId'] as String?,
      hasTherapistHelperControl: json['hasTherapistHelperControl'] as bool?,
      isTherapistSendToIsolatedCall:
          json['isTherapistSendToIsolatedCall'] as bool?,
    );

Map<String, dynamic> _$TherapistHelperGroupCallModelToJson(
        TherapistHelperGroupCallModel instance) =>
    <String, dynamic>{
      'therapistHelperId': instance.therapistHelperId,
      'meetingId': instance.meetingId,
      'hasTherapistHelperControl': instance.hasTherapistHelperControl,
      'isTherapistSendToIsolatedCall': instance.isTherapistSendToIsolatedCall,
    };
