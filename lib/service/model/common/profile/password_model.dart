import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'password_model.g.dart';

@JsonSerializable()
class PasswordModel extends INetworkModel<PasswordModel> {
  String? password;

  PasswordModel({
    this.password,
  });

  @override
  PasswordModel fromJson(Map<String, dynamic> json) =>
      PasswordModel.fromJson(json);

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PasswordModelToJson(this);
}
