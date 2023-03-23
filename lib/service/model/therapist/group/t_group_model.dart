import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_group_model.g.dart';

@JsonSerializable()
class TGroupModel extends INetworkModel<TGroupModel> {
  String? groupId;
  String? therapistId;
  String? name;
  String? therapistHelperId;
  String? therapistHelperName;
  bool? hasHelperTherapistAccepted;
  int? maxAllowedParticipants;
  List<String?>? participantsId;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  Timestamp? dateTime;

  static Timestamp? _timestampFromJson(Timestamp? timestamp) {
    return timestamp;
  }

  static Timestamp? _timestampToJson(Timestamp? timestamp) {
    return timestamp != null
        ? Timestamp.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
        : null;
  }

  TGroupModel({
    this.groupId,
    this.therapistId,
    this.name,
    this.therapistHelperId,
    this.therapistHelperName,
    this.hasHelperTherapistAccepted,
    this.maxAllowedParticipants,
    this.participantsId,
    this.dateTime,
  });

  @override
  TGroupModel fromJson(Map<String, dynamic> json) => TGroupModel.fromJson(json);

  factory TGroupModel.fromJson(Map<String, dynamic> json) =>
      _$TGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TGroupModelToJson(this);
}
