import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_group_session_model.g.dart';

@JsonSerializable()
class TGroupSessionModel extends INetworkModel<TGroupSessionModel> {
  String? id, groupId, therapistId, therapistHelperId, meetingId;

  String? therapistHelperName, therapistName;
  bool? isFinished;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  TGroupSessionModel({
    this.id,
    this.groupId,
    this.meetingId,
    this.therapistId,
    this.therapistHelperId,
    this.therapistHelperName,
    this.therapistName,
    this.dateTime,
    this.isFinished,
  });

  @override
  TGroupSessionModel fromJson(Map<String, dynamic> json) =>
      TGroupSessionModel.fromJson(json);

  factory TGroupSessionModel.fromJson(Map<String, dynamic> json) =>
      _$TGroupSessionModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TGroupSessionModelToJson(this);
}
