import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'about_therapist_model.g.dart';

@JsonSerializable()
class AboutTherapistModel extends INetworkModel<AboutTherapistModel>
    with EquatableMixin {
  String? therapistId;
  String? therapistUrl;
  String? therapistName;
  String? aboutTherapist;

  AboutTherapistModel({
    this.therapistId,
    this.therapistUrl,
    this.therapistName,
    this.aboutTherapist,
  });

  @override
  AboutTherapistModel fromJson(Map<String, dynamic> json) =>
      AboutTherapistModel.fromJson(json);

  factory AboutTherapistModel.fromJson(Map<String, dynamic> json) =>
      _$AboutTherapistModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AboutTherapistModelToJson(this);

  @override
  List<Object?> get props =>
      [therapistId, therapistUrl, therapistName, aboutTherapist];

  AboutTherapistModel copyWith({
    String? therapistId,
    String? therapistUrl,
    String? therapistName,
    String? aboutTherapist,
  }) {
    return AboutTherapistModel(
      therapistId: therapistId ?? this.therapistId,
      therapistUrl: therapistUrl ?? this.therapistUrl,
      therapistName: therapistName ?? this.therapistName,
      aboutTherapist: aboutTherapist ?? this.aboutTherapist,
    );
  }
}
