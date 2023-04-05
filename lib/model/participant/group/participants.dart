import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'participants.g.dart';

@JsonSerializable()
class Participants extends INetworkModel<Participants> with EquatableMixin {
  String? userId;
  String? avatarUrl;
  String? username;

  Participants({
    this.userId,
    this.avatarUrl,
    this.username,
  });

  @override
  Participants fromJson(Map<String, dynamic> json) =>
      Participants.fromJson(json);

  factory Participants.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ParticipantsToJson(this);

  @override
  List<Object?> get props => [userId, avatarUrl, username];

  Participants copyWith({
    String? userId,
    String? avatarUrl,
    String? username,
  }) {
    return Participants(
      userId: userId ?? this.userId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      username: username ?? this.username,
    );
  }
}
