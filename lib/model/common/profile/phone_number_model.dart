import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'phone_number_model.g.dart';

@JsonSerializable()
class PhoneNumberModel extends INetworkModel<PhoneNumberModel> {
  String? gender;

  PhoneNumberModel({
    this.gender,
  });

  @override
  PhoneNumberModel fromJson(Map<String, dynamic> json) => PhoneNumberModel.fromJson(json);

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PhoneNumberModelToJson(this);
}
