import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'name_model.g.dart';

@JsonSerializable()
class NameModel extends INetworkModel<NameModel> {
  String? name;

  NameModel({
    this.name,
  });

  @override
  NameModel fromJson(Map<String, dynamic> json) => NameModel.fromJson(json);

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$NameModelToJson(this);
}
