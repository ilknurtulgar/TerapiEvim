import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'is_session_complete_model.g.dart';

@JsonSerializable()
class IsSessionCompleteModel extends INetworkModel<IsSessionCompleteModel> {
  bool isSessionComplete;

  IsSessionCompleteModel({required this.isSessionComplete});

  @override
  IsSessionCompleteModel fromJson(Map<String, dynamic> json) =>
      IsSessionCompleteModel.fromJson(json);

  factory IsSessionCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$IsSessionCompleteModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$IsSessionCompleteModelToJson(this);
}
