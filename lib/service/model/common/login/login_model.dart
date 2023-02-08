import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends INetworkModel<LoginModel> with EquatableMixin {
  String? email;
  String? password;

  LoginModel({
    this.email,
    this.password,
  });

  @override
  LoginModel fromJson(Map<String, dynamic> json) => LoginModel.fromJson(json);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [email, password];

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
