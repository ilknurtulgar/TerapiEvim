// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      name: json['name'] as String?,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      aboutMe: json['aboutMe'] as String?,
      imageUrl: json['imageUrl'] as String?,
    )..userId = json['userId'] as String?;

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'aboutMe': instance.aboutMe,
      'imageUrl': instance.imageUrl,
    };
