import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
part 'short_call_model.g.dart';

@JsonSerializable()
class ShortCallModel extends INetworkModel<ShortCallModel> with EquatableMixin {
  String? callerId;
  String? calleeId;
  String? roomId;

  ShortCallModel({
    this.callerId,
    this.calleeId,
    this.roomId,
  });

  @override
  ShortCallModel fromJson(Map<String, dynamic> json) =>
      ShortCallModel.fromJson(json);

  factory ShortCallModel.fromJson(Map<String, dynamic> json) =>
      _$ShortCallModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ShortCallModelToJson(this);

  @override
  List<Object?> get props => [callerId, calleeId, roomId];

  ShortCallModel copyWith({
    String? callerId,
    String? calleeId,
    String? roomId,
  }) {
    return ShortCallModel(
      callerId: callerId ?? this.callerId,
      calleeId: calleeId ?? this.calleeId,
      roomId: roomId ?? this.roomId,
    );
  }
}
