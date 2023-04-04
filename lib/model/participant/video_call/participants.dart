import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'participants.g.dart';

@JsonSerializable()
class Participants extends INetworkModel<Participants> with EquatableMixin {
  String? userId;
  String? userName;

  Participants({
    this.userId,
    this.userName,
  });

  @override
  Participants fromJson(Map<String, dynamic> json) =>
      Participants.fromJson(json);

  factory Participants.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ParticipantsToJson(this);

  @override
  List<Object?> get props => [userId, userName];

  Participants copyWith({
    String? userId,
    String? userName,
  }) {
    return Participants(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }
}
