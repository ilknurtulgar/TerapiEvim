import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel> {
  String? userId,
      name,
      birthDate,
      gender,
      email,
      phone,
      role,
      aboutMe,
      imageUrl;

  LoginResponseModel({
    this.name,
    this.birthDate,
    this.gender,
    this.email,
    this.phone,
    this.role,
    this.aboutMe,
    this.imageUrl,
  });

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      LoginResponseModel.fromJson(json);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LoginResponseModelToJson(this);
}
