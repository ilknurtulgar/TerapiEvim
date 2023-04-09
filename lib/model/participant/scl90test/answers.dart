import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'answers.g.dart';

@JsonSerializable()
class Answers extends INetworkModel<Answers> {
  int? id;
  int? response;

  Answers({
    this.id,
    this.response,
  });

  @override
  Answers fromJson(Map<String, dynamic> json) => Answers.fromJson(json);

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AnswersToJson(this);
}
