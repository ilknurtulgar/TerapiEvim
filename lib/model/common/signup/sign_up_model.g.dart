// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      name: json['name'] as String,
      birthDate: json['birthDate'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
    };