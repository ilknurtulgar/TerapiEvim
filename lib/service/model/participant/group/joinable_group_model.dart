import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'joinable_group_model.g.dart';

@JsonSerializable()
class JoinableGroupModel extends INetworkModel<JoinableGroupModel>
    with EquatableMixin {
  String? groupName;
  String? therapistName;
  String? therapistUrl;
  String? advisorName;
  String? advisorUrl;
  int? participantNumber;
  int? sessionNumber;
  String? id;

  JoinableGroupModel({
    this.groupName,
    this.therapistName,
    this.therapistUrl,
    this.advisorName,
    this.advisorUrl,
    this.participantNumber,
    this.sessionNumber,
    this.id,
  });

  @override
  JoinableGroupModel fromJson(Map<String, dynamic> json) =>
      JoinableGroupModel.fromJson(json);

  factory JoinableGroupModel.fromJson(Map<String, dynamic> json) =>
      _$JoinableGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JoinableGroupModelToJson(this);

  @override
  List<Object?> get props => [
        groupName,
        therapistName,
        therapistUrl,
        advisorName,
        advisorUrl,
        participantNumber,
        sessionNumber,
        id
      ];

  JoinableGroupModel copyWith({
    String? groupName,
    String? therapistName,
    String? therapistUrl,
    String? advisorName,
    String? advisorUrl,
    int? participantNumber,
    int? sessionNumber,
    String? id,
  }) {
    return JoinableGroupModel(
      groupName: groupName ?? this.groupName,
      therapistName: therapistName ?? this.therapistName,
      therapistUrl: therapistUrl ?? this.therapistUrl,
      advisorName: advisorName ?? this.advisorName,
      advisorUrl: advisorUrl ?? this.advisorUrl,
      participantNumber: participantNumber ?? this.participantNumber,
      sessionNumber: sessionNumber ?? this.sessionNumber,
      id: id ?? this.id,
    );
  }
}
