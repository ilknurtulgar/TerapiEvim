import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'video_call_token_model.g.dart';

@JsonSerializable()
class VideoCallTokenModel extends INetworkModel<VideoCallTokenModel> {
  final String meetingId, token, participantId;
  final bool isTherapist;

  VideoCallTokenModel({
    required this.meetingId,
    required this.token,
    required this.participantId,
    required this.isTherapist,
  });

  @override
  VideoCallTokenModel fromJson(Map<String, dynamic> json) =>
      VideoCallTokenModel.fromJson(json);

  factory VideoCallTokenModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCallTokenModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VideoCallTokenModelToJson(this);
}
