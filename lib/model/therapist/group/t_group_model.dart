import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_group_model.g.dart';

@JsonSerializable()
class TGroupModel extends INetworkModel<TGroupModel> {
  String? id;
  String? therapistId, therapistName;
  String? name;
  String? groupCategory;
  String? therapistHelperId;
  String? therapistHelperName;
  bool? hasHelperTherapistAccepted;

  int? numberOfWeeks, numberOfSessions;

  List<String>? participantsId;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  TGroupModel({
    this.id,
    this.groupCategory,
    this.therapistName,
    this.therapistId,
    this.name,
    this.therapistHelperId,
    this.therapistHelperName,
    this.hasHelperTherapistAccepted,
    this.participantsId,
    this.dateTime,
    this.numberOfWeeks,
    this.numberOfSessions,
  });

  @override
  TGroupModel fromJson(Map<String, dynamic> json) => TGroupModel.fromJson(json);

  factory TGroupModel.fromJson(Map<String, dynamic> json) =>
      _$TGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TGroupModelToJson(this);
}
