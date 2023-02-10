import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'participants.dart';
part 'video_call_model.g.dart';

@JsonSerializable()
class VideoCallModel extends INetworkModel<VideoCallModel> with EquatableMixin {
  String? therapistId;
  String? therapistName;
  String? advisorId;
  String? advisorName;
  String? roomId;
  List<Participants>? participants;

  VideoCallModel({
    this.therapistId,
    this.therapistName,
    this.advisorId,
    this.advisorName,
    this.roomId,
    this.participants,
  });

  @override
  VideoCallModel fromJson(Map<String, dynamic> json) =>
      VideoCallModel.fromJson(json);

  factory VideoCallModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCallModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VideoCallModelToJson(this);

  @override
  List<Object?> get props => [
        therapistId,
        therapistName,
        advisorId,
        advisorName,
        roomId,
        participants
      ];

  VideoCallModel copyWith({
    String? therapistId,
    String? therapistName,
    String? advisorId,
    String? advisorName,
    String? roomId,
    List<Participants>? participants,
  }) {
    return VideoCallModel(
      therapistId: therapistId ?? this.therapistId,
      therapistName: therapistName ?? this.therapistName,
      advisorId: advisorId ?? this.advisorId,
      advisorName: advisorName ?? this.advisorName,
      roomId: roomId ?? this.roomId,
      participants: participants ?? this.participants,
    );
  }
}
