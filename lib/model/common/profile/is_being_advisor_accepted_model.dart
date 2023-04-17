import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'is_being_advisor_accepted_model.g.dart';

@JsonSerializable()
class IsBeingAdvisorAcceptedModel
    extends INetworkModel<IsBeingAdvisorAcceptedModel> {
  bool? isBeingAdvisorAccepted;

  IsBeingAdvisorAcceptedModel({
    this.isBeingAdvisorAccepted,
  });

  @override
  IsBeingAdvisorAcceptedModel fromJson(Map<String, dynamic> json) =>
      IsBeingAdvisorAcceptedModel.fromJson(json);

  factory IsBeingAdvisorAcceptedModel.fromJson(Map<String, dynamic> json) =>
      _$IsBeingAdvisorAcceptedModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$IsBeingAdvisorAcceptedModelToJson(this);
}
