import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'isolated_call_model.g.dart';

@JsonSerializable()
class IsolatedCallModel extends INetworkModel<IsolatedCallModel>
    with EquatableMixin {
  String? advisorId;
  String? advisorName;
  String? roomId;
  String? participantId;
  String? participantName;

  IsolatedCallModel({
    this.advisorId,
    this.advisorName,
    this.roomId,
    this.participantId,
    this.participantName,
  });

  @override
  IsolatedCallModel fromJson(Map<String, dynamic> json) =>
      IsolatedCallModel.fromJson(json);

  factory IsolatedCallModel.fromJson(Map<String, dynamic> json) =>
      _$IsolatedCallModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$IsolatedCallModelToJson(this);

  @override
  List<Object?> get props =>
      [advisorId, advisorName, roomId, participantId, participantName];

  IsolatedCallModel copyWith({
    String? advisorId,
    String? advisorName,
    String? roomId,
    String? participantId,
    String? participantName,
  }) {
    return IsolatedCallModel(
      advisorId: advisorId ?? this.advisorId,
      advisorName: advisorName ?? this.advisorName,
      roomId: roomId ?? this.roomId,
      participantId: participantId ?? this.participantId,
      participantName: participantName ?? this.participantName,
    );
  }
}
