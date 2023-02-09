import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'joined_activity.g.dart';

@JsonSerializable()
class JoinedActivity extends INetworkModel<JoinedActivity> with EquatableMixin {
  String? id;
  String? therapistName;
  String? activityTitle;

  JoinedActivity({
    this.id,
    this.therapistName,
    this.activityTitle,
  });

  @override
  JoinedActivity fromJson(Map<String, dynamic> json) =>
      JoinedActivity.fromJson(json);

  factory JoinedActivity.fromJson(Map<String, dynamic> json) =>
      _$JoinedActivityFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JoinedActivityToJson(this);

  @override
  List<Object?> get props => [id, therapistName, activityTitle];

  JoinedActivity copyWith({
    String? id,
    String? therapistName,
    String? activityTitle,
  }) {
    return JoinedActivity(
      id: id ?? this.id,
      therapistName: therapistName ?? this.therapistName,
      activityTitle: activityTitle ?? this.activityTitle,
    );
  }
}
