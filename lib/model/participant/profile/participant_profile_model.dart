import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import 'active_group.dart';
import 'browsed.dart';
import 'joined_activity.dart';

part 'participant_profile_model.g.dart';

@JsonSerializable()
class ParticipantProfileModel extends INetworkModel<ParticipantProfileModel>
    with EquatableMixin {
  String? participantName;
  String? participantUrl;
  String? birthday;
  ActiveGroup? activeGroup;
  List<Browsed>? browsed;
  List<JoinedActivity>? joinedActivity;

  ParticipantProfileModel({
    this.participantName,
    this.participantUrl,
    this.birthday,
    this.activeGroup,
    this.browsed,
    this.joinedActivity,
  });

  @override
  ParticipantProfileModel fromJson(Map<String, dynamic> json) =>
      ParticipantProfileModel.fromJson(json);

  factory ParticipantProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantProfileModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ParticipantProfileModelToJson(this);

  @override
  List<Object?> get props => [
        participantName,
        participantUrl,
        birthday,
        activeGroup,
        browsed,
        joinedActivity
      ];

  ParticipantProfileModel copyWith({
    String? participantName,
    String? participantUrl,
    String? birthday,
    ActiveGroup? activeGroup,
    List<Browsed>? browsed,
    List<JoinedActivity>? joinedActivity,
  }) {
    return ParticipantProfileModel(
      participantName: participantName ?? this.participantName,
      participantUrl: participantUrl ?? this.participantUrl,
      birthday: birthday ?? this.birthday,
      activeGroup: activeGroup ?? this.activeGroup,
      browsed: browsed ?? this.browsed,
      joinedActivity: joinedActivity ?? this.joinedActivity,
    );
  }
}
