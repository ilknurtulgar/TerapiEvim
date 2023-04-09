import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'scl_90_submission_model.g.dart';

@JsonSerializable()
class Scl90SubmissionModel extends INetworkModel<Scl90SubmissionModel> {
  bool? isScl90Submitted;

  Scl90SubmissionModel({this.isScl90Submitted});

  @override
  Scl90SubmissionModel fromJson(Map<String, dynamic> json) =>
      Scl90SubmissionModel.fromJson(json);

  factory Scl90SubmissionModel.fromJson(Map<String, dynamic> json) =>
      _$Scl90SubmissionModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$Scl90SubmissionModelToJson(this);

}
