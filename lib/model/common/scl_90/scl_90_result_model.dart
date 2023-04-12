import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'scl_90_result_model.g.dart';

@JsonSerializable()
class Scl90ResultModel extends INetworkModel<Scl90ResultModel> {
  String? id, participantId;
  double? somatization,
      oKB,
      interpersonalSensitivity,
      depression,
      anxiety,
      angerEnmity,
      phobicAnxiety,
      paranoidThought,
      psychoticism,
      additionalScales;
  String? timestamp;

  Scl90ResultModel({
    this.id,
    this.participantId,
    this.somatization,
    this.oKB,
    this.interpersonalSensitivity,
    this.depression,
    this.anxiety,
    this.angerEnmity,
    this.phobicAnxiety,
    this.paranoidThought,
    this.psychoticism,
    this.additionalScales,
    this.timestamp,
  });

  @override
  Scl90ResultModel fromJson(Map<String, dynamic> json) =>
      Scl90ResultModel.fromJson(json);

  factory Scl90ResultModel.fromJson(Map<String, dynamic> json) =>
      _$Scl90ResultModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$Scl90ResultModelToJson(this);
}
