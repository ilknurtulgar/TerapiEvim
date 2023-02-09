import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'approaching.g.dart';

@JsonSerializable()
class Approaching extends INetworkModel<Approaching> with EquatableMixin {
  String? therapist;
  String? therapistId;
  String? advisor;
  String? advisorId;
  String? time;
  String? id;

  Approaching({
    this.therapist,
    this.therapistId,
    this.advisor,
    this.advisorId,
    this.time,
    this.id,
  });

  @override
  Approaching fromJson(Map<String, dynamic> json) => Approaching.fromJson(json);

  factory Approaching.fromJson(Map<String, dynamic> json) =>
      _$ApproachingFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ApproachingToJson(this);

  @override
  List<Object?> get props =>
      [therapist, therapistId, advisor, advisorId, time, id];

  Approaching copyWith({
    String? therapist,
    String? therapistId,
    String? advisor,
    String? advisorId,
    String? time,
    String? id,
  }) {
    return Approaching(
      therapist: therapist ?? this.therapist,
      therapistId: therapistId ?? this.therapistId,
      advisor: advisor ?? this.advisor,
      advisorId: advisorId ?? this.advisorId,
      time: time ?? this.time,
      id: id ?? this.id,
    );
  }
}
