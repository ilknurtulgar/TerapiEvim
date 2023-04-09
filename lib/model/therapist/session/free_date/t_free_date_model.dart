import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import 't_free_hours_model.dart';

part 't_free_date_model.g.dart';

@JsonSerializable()
class TFreeDateModel extends INetworkModel<TFreeDateModel> {
  String? id;
  String? therapistId;
  String? meetId;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timestamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  @JsonKey(includeToJson: false)
  List<TFreeHoursModel> hours;

  TFreeDateModel({
    this.id,
    this.therapistId,
    this.dateTime,
    this.meetId,
    this.hours = const [],
  });

  @override
  TFreeDateModel fromJson(Map<String, dynamic> json) =>
      TFreeDateModel.fromJson(json);

  factory TFreeDateModel.fromJson(Map<String, dynamic> json) =>
      _$TFreeDateModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TFreeDateModelToJson(this);
}
