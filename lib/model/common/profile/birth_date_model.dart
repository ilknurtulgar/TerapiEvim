import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'birth_date_model.g.dart';

@JsonSerializable()
class BirthDateModel extends INetworkModel<BirthDateModel> {
  String? birthdate;

  BirthDateModel({
    this.birthdate,
  });

  @override
  BirthDateModel fromJson(Map<String, dynamic> json) =>
      BirthDateModel.fromJson(json);

  factory BirthDateModel.fromJson(Map<String, dynamic> json) =>
      _$BirthDateModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$BirthDateModelToJson(this);
}
