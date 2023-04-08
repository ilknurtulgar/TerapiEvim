import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_join_video_call_result_model.g.dart';

@JsonSerializable()
class TJoinVideoCallResultModel extends INetworkModel<TJoinVideoCallResultModel> {
  String? id, participantId, participantName;

  TJoinVideoCallResultModel({
    this.id,
    this.participantId,
    this.participantName,
  });

  @override
  TJoinVideoCallResultModel fromJson(Map<String, dynamic> json) =>
      TJoinVideoCallResultModel.fromJson(json);

  factory TJoinVideoCallResultModel.fromJson(Map<String, dynamic> json) =>
      _$TJoinVideoCallResultModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TJoinVideoCallResultModelToJson(this);
}
