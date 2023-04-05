// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_s_c_l90_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestSCL90Model _$TestSCL90ModelFromJson(Map<String, dynamic> json) =>
    TestSCL90Model(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestSCL90ModelToJson(TestSCL90Model instance) =>
    <String, dynamic>{
      'answers': instance.answers,
    };
