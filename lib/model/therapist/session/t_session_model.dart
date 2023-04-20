import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import '../../../core/managers/converter/timestamp_converter.dart';

part 't_session_model.g.dart';

@JsonSerializable()
class TSessionModel extends INetworkModel<TSessionModel> {
  String? id, participantId, freeDateId, therapistId, participantName;
  bool? isFinished, isGroupCategorySet;

  /// participant's selected date
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  TSessionModel({
    this.id,
    this.participantId,
    this.participantName,
    this.isFinished,
    this.therapistId,
    this.dateTime,
    this.freeDateId,
    this.isGroupCategorySet,
  });

  @override
  TSessionModel fromJson(Map<String, dynamic> json) =>
      TSessionModel.fromJson(json);

  factory TSessionModel.fromJson(Map<String, dynamic> json) =>
      _$TSessionModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TSessionModelToJson(this);
}
