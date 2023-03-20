import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
import 'meetings_date.dart';
part 't_group_model.g.dart';

@JsonSerializable()
class TGroupModel extends INetworkModel<TGroupModel> {
  String? id;
  String? name;
  String? therapistHelperId;
  List<MeetingsDate>? meetingsDate;

  TGroupModel({
    this.id,
    this.name,
    this.therapistHelperId,
    this.meetingsDate,
  });

  @override
  TGroupModel fromJson(Map<String, dynamic> json) => TGroupModel.fromJson(json);

  factory TGroupModel.fromJson(Map<String, dynamic> json) =>
      _$TGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TGroupModelToJson(this);
}
