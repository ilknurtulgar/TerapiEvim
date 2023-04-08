import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_free_hours_model.g.dart';

@JsonSerializable()
class TFreeHoursModel extends INetworkModel<TFreeHoursModel> {
  bool? isFree;
  String? participantId;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timestamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? hour;

  TFreeHoursModel({
    this.hour,
    this.isFree,
    this.participantId,
  });

  @override
  TFreeHoursModel fromJson(Map<String, dynamic> json) =>
      TFreeHoursModel.fromJson(json);

  factory TFreeHoursModel.fromJson(Map<String, dynamic> json) =>
      _$TFreeHoursModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TFreeHoursModelToJson(this);
}
