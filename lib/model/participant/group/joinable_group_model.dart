import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'joinable_group_model.g.dart';

@JsonSerializable()
class JoinableGroupModel extends INetworkModel<JoinableGroupModel> {
  String? id,
      name,
      therapistId,
      therapistName,
      therapistImageUrl,
      therapistHelperId,
      therapistHelperName,
      therapistHelperImageUrl,
      participantNumber,
      numberOfSessions,
      numberOfWeeks;

  JoinableGroupModel({
    this.id,
    this.name,
    this.therapistId,
    this.therapistName,
    this.therapistImageUrl,
    this.therapistHelperId,
    this.therapistHelperName,
    this.therapistHelperImageUrl,
    this.participantNumber,
    this.numberOfSessions,
    this.numberOfWeeks,
  });

  @override
  JoinableGroupModel fromJson(Map<String, dynamic> json) =>
      JoinableGroupModel.fromJson(json);

  factory JoinableGroupModel.fromJson(Map<String, dynamic> json) =>
      _$JoinableGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JoinableGroupModelToJson(this);
}
