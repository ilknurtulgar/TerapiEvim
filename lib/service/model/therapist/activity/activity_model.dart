import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel extends INetworkModel<ActivityModel> {
  String? id;
  String? therapistId;
  String? title;
  String? description;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  Timestamp? dateTime;
  bool? isFinished;
  List<String>? participantsId;

  ActivityModel({
    this.therapistId,
    this.title,
    this.description,
    this.dateTime,
    this.isFinished,
    this.participantsId,
  });

  static Timestamp? _timestampFromJson(Timestamp? timestamp) {
    return timestamp;
  }

  static Timestamp? _timestampToJson(Timestamp? timestamp) {
    return timestamp != null
        ? Timestamp.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
        : null;
  }

  @override
  ActivityModel fromJson(Map<String, dynamic> json) =>
      ActivityModel.fromJson(json);

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ActivityModelToJson(this);
}
