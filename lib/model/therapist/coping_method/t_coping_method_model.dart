import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/converter/timestamp_converter.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_coping_method_model.g.dart';

@JsonSerializable()
class TCopingMethodModel extends INetworkModel<TCopingMethodModel> {
  String? id;
  String? therapistId;
  String? therapistName;
  String? therapistAvatarUrl;
  String? description;
  String? docUrl;

  /// Timestamp.fromDate(DateTime.now()) is an example of using timeStamp
  @JsonKey(
    fromJson: TimeStampConverter.timestampFromJson,
    toJson: TimeStampConverter.timestampToJson,
  )
  Timestamp? dateTime;

  TCopingMethodModel({
    this.id,
    this.therapistId,
    this.therapistName,
    this.therapistAvatarUrl,
    this.description,
    this.docUrl,
    this.dateTime,
  });

  @override
  TCopingMethodModel fromJson(Map<String, dynamic> json) =>
      TCopingMethodModel.fromJson(json);

  factory TCopingMethodModel.fromJson(Map<String, dynamic> json) =>
      _$TCopingMethodModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TCopingMethodModelToJson(this);
}
