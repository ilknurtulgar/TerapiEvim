import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'short_call_session_id_model.g.dart';

@JsonSerializable()
class ShortCallSessionIdModel extends INetworkModel<ShortCallSessionIdModel> {
  String? shortCallSessionId;
  bool? isSessionSelected;

  ShortCallSessionIdModel({
    this.shortCallSessionId,
    this.isSessionSelected,
  });

  @override
  ShortCallSessionIdModel fromJson(Map<String, dynamic> json) =>
      ShortCallSessionIdModel.fromJson(json);

  factory ShortCallSessionIdModel.fromJson(Map<String, dynamic> json) =>
      _$ShortCallSessionIdModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ShortCallSessionIdModelToJson(this);


}
