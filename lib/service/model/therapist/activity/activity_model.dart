import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable()
class ActivityModel extends INetworkModel<ActivityModel> {
  String? id;
  String? title;
  String? description;
  String? date;
  String? hour;
  List<String>? participantsId;

  ActivityModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.hour,
    this.participantsId,
  });

  @override
  ActivityModel fromJson(Map<String, dynamic> json) =>
      ActivityModel.fromJson(json);

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ActivityModelToJson(this);
}
