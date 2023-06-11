import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'join_group_id_model.g.dart';

@JsonSerializable()
class JoinGroupIdModel extends INetworkModel<JoinGroupIdModel> {
  String? joinedGroupId;

  JoinGroupIdModel({this.joinedGroupId});

  @override
  JoinGroupIdModel fromJson(Map<String, dynamic> json) =>
      JoinGroupIdModel.fromJson(json);

  factory JoinGroupIdModel.fromJson(Map<String, dynamic> json) =>
      _$JoinGroupIdModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JoinGroupIdModelToJson(this);
}
