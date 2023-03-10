import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel extends INetworkModel<SignUpModel> with EquatableMixin {
  String name;
  String birthDate;
  String gender;
  String email;
  String phone;

  SignUpModel({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phone,
  });

  @override
  SignUpModel fromJson(Map<String, dynamic> json) => SignUpModel.fromJson(json);

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SignUpModelToJson(this);

  @override
  List<Object?> get props => [name, birthDate, gender, email, phone];
}
