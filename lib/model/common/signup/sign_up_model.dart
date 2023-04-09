import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends INetworkModel<SignUpModel> {
  String? id;
  String name;
  String birthDate;
  String gender;
  String email;
  String phone;
  String role;

  SignUpModel({
    this.id,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phone,
    required this.role,
  });

  @override
  SignUpModel fromJson(Map<String, dynamic> json) => SignUpModel.fromJson(json);

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SignUpModelToJson(this);
}
