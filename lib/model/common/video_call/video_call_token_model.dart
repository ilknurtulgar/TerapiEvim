import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'video_call_token_model.g.dart';

@JsonSerializable()
class VideoCallTokenModel extends INetworkModel<VideoCallTokenModel> {
  final String meetingId, token, participantId, therapistHelperId;
  final bool isTherapist, isMainTherapist;

  VideoCallTokenModel({
    required this.meetingId,
    required this.token,
    this.therapistHelperId = '',
    required this.participantId,
    required this.isTherapist,
    this.isMainTherapist = false,
  });

  @override
  VideoCallTokenModel fromJson(Map<String, dynamic> json) =>
      VideoCallTokenModel.fromJson(json);

  factory VideoCallTokenModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCallTokenModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$VideoCallTokenModelToJson(this);
}
