import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'approaching.dart';
import 'participants.dart';
part 'fetched_group_model.g.dart';

@JsonSerializable()
class FetchedGroupModel extends INetworkModel<FetchedGroupModel>
    with EquatableMixin {
  List<Approaching>? approaching;
  List<Participants>? participants;

  FetchedGroupModel({
    this.approaching,
    this.participants,
  });

  @override
  FetchedGroupModel fromJson(Map<String, dynamic> json) =>
      FetchedGroupModel.fromJson(json);

  factory FetchedGroupModel.fromJson(Map<String, dynamic> json) =>
      _$FetchedGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FetchedGroupModelToJson(this);

  @override
  List<Object?> get props => [approaching, participants];

  FetchedGroupModel copyWith({
    List<Approaching>? approaching,
    List<Participants>? participants,
  }) {
    return FetchedGroupModel(
      approaching: approaching ?? this.approaching,
      participants: participants ?? this.participants,
    );
  }
}
