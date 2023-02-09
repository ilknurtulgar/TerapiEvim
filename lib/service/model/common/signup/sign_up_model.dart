import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends INetworkModel<SignUpModel> with EquatableMixin {
  String? name;
  String? birthDate;
  String? gender;
  String? email;
  String? password;
  String? phone;

  SignUpModel({
    this.name,
    this.birthDate,
    this.gender,
    this.email,
    this.password,
    this.phone,
  });

  @override
  SignUpModel fromJson(Map<String, dynamic> json) => SignUpModel.fromJson(json);

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SignUpModelToJson(this);

  @override
  List<Object?> get props => [name, birthDate, gender, email, password, phone];

  SignUpModel copyWith({
    String? name,
    String? birthDate,
    String? gender,
    String? email,
    String? password,
    String? phone,
  }) {
    return SignUpModel(
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }
}
