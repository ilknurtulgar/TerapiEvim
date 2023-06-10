import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import 'activities_model.dart';

part 'fetched_activities_model.g.dart';

@JsonSerializable()
class FetchedActivitiesModel extends INetworkModel<FetchedActivitiesModel>
    with EquatableMixin {
  List<ActivitiesModel>? approaching;
  List<ActivitiesModel>? past;

  FetchedActivitiesModel({
    this.approaching,
    this.past,
  });

  @override
  FetchedActivitiesModel fromJson(Map<String, dynamic> json) =>
      FetchedActivitiesModel.fromJson(json);

  factory FetchedActivitiesModel.fromJson(Map<String, dynamic> json) =>
      _$FetchedActivitiesModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FetchedActivitiesModelToJson(this);

  @override
  List<Object?> get props => [approaching, past];

  FetchedActivitiesModel copyWith({
    List<ActivitiesModel>? approaching,
    List<ActivitiesModel>? past,
  }) {
    return FetchedActivitiesModel(
      approaching: approaching ?? this.approaching,
      past: past ?? this.past,
    );
  }
}
