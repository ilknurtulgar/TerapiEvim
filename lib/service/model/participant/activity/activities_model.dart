import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'activities_model.g.dart';

@JsonSerializable()
class ActivitiesModel extends INetworkModel<ActivitiesModel>
    with EquatableMixin {
  String? title;
  String? therapist;
  String? time;
  String? id;

  ActivitiesModel({
    this.title,
    this.therapist,
    this.time,
    this.id,
  });

  @override
  ActivitiesModel fromJson(Map<String, dynamic> json) =>
      ActivitiesModel.fromJson(json);

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ActivitiesModelToJson(this);

  @override
  List<Object?> get props => [title, therapist, time, id];

  ActivitiesModel copyWith({
    String? title,
    String? therapist,
    String? time,
    String? id,
  }) {
    return ActivitiesModel(
      title: title ?? this.title,
      therapist: therapist ?? this.therapist,
      time: time ?? this.time,
      id: id ?? this.id,
    );
  }
}
