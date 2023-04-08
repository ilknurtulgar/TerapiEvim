import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_seminar_model.g.dart';

@JsonSerializable()
class TSeminarModel extends INetworkModel<TSeminarModel> {
  String? id;
  String? therapistId;
  String? name;
  String? therapistHelperId;
  String? therapistHelperName;

  List<String?>? participantsId;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  TSeminarModel({
    this.id,
    this.therapistId,
    this.name,
    this.therapistHelperId,
    this.therapistHelperName,
    this.participantsId,
    this.dateTime,
  });

  @override
  TSeminarModel fromJson(Map<String, dynamic> json) =>
      TSeminarModel.fromJson(json);

  factory TSeminarModel.fromJson(Map<String, dynamic> json) =>
      _$TSeminarModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TSeminarModelToJson(this);
}
