import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  String? birthDate, email, gender, name, phone, role, id;

  UserModel({
    this.id,
    this.birthDate,
    this.email,
    this.gender,
    this.name,
    this.phone,
    this.role,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserModelToJson(this);
}
