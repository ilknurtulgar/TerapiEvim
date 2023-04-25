import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'isolated_call_meeting_id_model.g.dart';

@JsonSerializable()
class ShortCallMeetingIdModel extends INetworkModel<ShortCallMeetingIdModel>  {
  String? meetingId;

  ShortCallMeetingIdModel({this.meetingId});

  @override
  ShortCallMeetingIdModel fromJson(Map<String, dynamic> json) =>
      ShortCallMeetingIdModel.fromJson(json);

  factory ShortCallMeetingIdModel.fromJson(Map<String, dynamic> json) =>
      _$ShortCallMeetingIdModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ShortCallMeetingIdModelToJson(this);

}
