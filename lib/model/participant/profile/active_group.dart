import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'active_group.g.dart';

@JsonSerializable()
class ActiveGroup extends INetworkModel<ActiveGroup> with EquatableMixin {
  String? id;
  String? groupName;
  String? therapistName;
  String? advisorName;
  String? date;

  ActiveGroup({
    this.id,
    this.groupName,
    this.therapistName,
    this.advisorName,
    this.date,
  });

  @override
  ActiveGroup fromJson(Map<String, dynamic> json) => ActiveGroup.fromJson(json);

  factory ActiveGroup.fromJson(Map<String, dynamic> json) =>
      _$ActiveGroupFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ActiveGroupToJson(this);

  @override
  List<Object?> get props => [id, groupName, therapistName, advisorName, date];

  ActiveGroup copyWith({
    String? id,
    String? groupName,
    String? therapistName,
    String? advisorName,
    String? date,
  }) {
    return ActiveGroup(
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      therapistName: therapistName ?? this.therapistName,
      advisorName: advisorName ?? this.advisorName,
      date: date ?? this.date,
    );
  }
}
