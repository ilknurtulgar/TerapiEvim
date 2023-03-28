import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_activity_model.g.dart';

@JsonSerializable()
class TActivityModel extends INetworkModel<TActivityModel> {
  String? id,
      therapistId,
      therapistName,
      title,
      description,
      meetingId,
      recordUrl;
  bool? isFinished, isStarted;
  List<String>? participantsId;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  TActivityModel({
    this.id,
    this.therapistId,
    this.participantsId,
    this.title,
    this.description,
    this.dateTime,
    this.isFinished,
    this.isStarted,
    this.meetingId,
    this.recordUrl,
  });

  @override
  TActivityModel fromJson(Map<String, dynamic> json) =>
      TActivityModel.fromJson(json);

  factory TActivityModel.fromJson(Map<String, dynamic> json) =>
      _$TActivityModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TActivityModelToJson(this);
}
