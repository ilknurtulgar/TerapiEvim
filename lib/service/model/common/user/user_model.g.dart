// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      birthDate: json['birthDate'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'birthDate': instance.birthDate,
      'email': instance.email,
      'gender': instance.gender,
      'name': instance.name,
      'phone': instance.phone,
      'role': instance.role,
      'id': instance.id,
    };
