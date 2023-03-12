import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends INetworkModel<LoginModel> with EquatableMixin {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  @override
  LoginModel fromJson(Map<String, dynamic> json) => LoginModel.fromJson(json);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [email, password];
}
