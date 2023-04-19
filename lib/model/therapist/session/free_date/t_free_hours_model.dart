import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_free_hours_model.g.dart';

@JsonSerializable()
class TFreeHoursModel extends INetworkModel<TFreeHoursModel> {
  bool? isFree;
  String? participantId, freeDateId,hour;

  TFreeHoursModel({
    this.hour,
    this.isFree,
    this.participantId,
    this.freeDateId,
  });

  @override
  TFreeHoursModel fromJson(Map<String, dynamic> json) =>
      TFreeHoursModel.fromJson(json);

  factory TFreeHoursModel.fromJson(Map<String, dynamic> json) =>
      _$TFreeHoursModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TFreeHoursModelToJson(this);
}
