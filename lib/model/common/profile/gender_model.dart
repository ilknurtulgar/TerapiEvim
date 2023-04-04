import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'gender_model.g.dart';

@JsonSerializable()
class GenderModel extends INetworkModel<GenderModel> {
  String? gender;

  GenderModel({
    this.gender,
  });

  @override
  GenderModel fromJson(Map<String, dynamic> json) => GenderModel.fromJson(json);

  factory GenderModel.fromJson(Map<String, dynamic> json) =>
      _$GenderModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$GenderModelToJson(this);
}
