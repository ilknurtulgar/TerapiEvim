import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'session_id_model.g.dart';

@JsonSerializable()
class SessionIdModel extends INetworkModel<SessionIdModel> {
  String? sessionId;

  SessionIdModel({
    this.sessionId,
  });

  @override
  SessionIdModel fromJson(Map<String, dynamic> json) =>
      SessionIdModel.fromJson(json);

  factory SessionIdModel.fromJson(Map<String, dynamic> json) =>
      _$SessionIdModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SessionIdModelToJson(this);
}
