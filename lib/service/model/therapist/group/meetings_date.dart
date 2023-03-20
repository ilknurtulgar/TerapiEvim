import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';
part 'meetings_date.g.dart';

@JsonSerializable()
class MeetingsDate extends INetworkModel<MeetingsDate> {
  String? date;
  String? time;

  MeetingsDate({
    this.date,
    this.time,
  });

  @override
  MeetingsDate fromJson(Map<String, dynamic> json) =>
      MeetingsDate.fromJson(json);

  factory MeetingsDate.fromJson(Map<String, dynamic> json) =>
      _$MeetingsDateFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MeetingsDateToJson(this);
}