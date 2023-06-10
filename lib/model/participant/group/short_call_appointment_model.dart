import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'short_call_appointment_model.g.dart';

@JsonSerializable()
class ShortCallAppointmentModel extends INetworkModel<ShortCallAppointmentModel>
    with EquatableMixin {
  String? therapistName;
  String? therapistUrl;
  String? date;
  List<String>? time;
  String? id;

  ShortCallAppointmentModel({
    this.therapistName,
    this.therapistUrl,
    this.date,
    this.time,
    this.id,
  });

  @override
  ShortCallAppointmentModel fromJson(Map<String, dynamic> json) =>
      ShortCallAppointmentModel.fromJson(json);

  factory ShortCallAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShortCallAppointmentModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ShortCallAppointmentModelToJson(this);

  @override
  List<Object?> get props => [therapistName, therapistUrl, date, time, id];

  ShortCallAppointmentModel copyWith({
    String? therapistName,
    String? therapistUrl,
    String? date,
    List<String>? time,
    String? id,
  }) {
    return ShortCallAppointmentModel(
      therapistName: therapistName ?? this.therapistName,
      therapistUrl: therapistUrl ?? this.therapistUrl,
      date: date ?? this.date,
      time: time ?? this.time,
      id: id ?? this.id,
    );
  }
}
