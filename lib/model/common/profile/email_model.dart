import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'email_model.g.dart';

@JsonSerializable()
class EmailModel extends INetworkModel<EmailModel> {
  String? email;

  EmailModel({
    this.email,
  });

  @override
  EmailModel fromJson(Map<String, dynamic> json) => EmailModel.fromJson(json);

  factory EmailModel.fromJson(Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$EmailModelToJson(this);
}
