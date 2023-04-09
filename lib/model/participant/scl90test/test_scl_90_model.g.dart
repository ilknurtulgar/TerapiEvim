// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_scl_90_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestSCL90Model _$TestSCL90ModelFromJson(Map<String, dynamic> json) =>
    TestSCL90Model(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..id = json['id'] as String?
      ..participantId = json['participantId'] as String?;

Map<String, dynamic> _$TestSCL90ModelToJson(TestSCL90Model instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participantId': instance.participantId,
      'answers': instance.answers,
    };
