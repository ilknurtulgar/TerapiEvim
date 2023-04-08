import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_initial_data.g.dart';

@JsonSerializable()
class TInitialData extends INetworkModel<TInitialData> {
  String? aboutMe;

  TInitialData({
    this.aboutMe,
  });

  @override
  TInitialData fromJson(Map<String, dynamic> json) =>
      TInitialData.fromJson(json);

  factory TInitialData.fromJson(Map<String, dynamic> json) =>
      _$TInitialDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TInitialDataToJson(this);
}
