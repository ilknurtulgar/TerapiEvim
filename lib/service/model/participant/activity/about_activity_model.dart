import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'about_activity_model.g.dart';

@JsonSerializable()
class AboutActivityModel extends INetworkModel<AboutActivityModel>
    with EquatableMixin {
  String? therapistName;
  String? therapistId;
  String? therapistUrl;
  String? aboutTherapist;
  String? activityName;
  String? aboutActivity;
  String? date;

  AboutActivityModel({
    this.therapistName,
    this.therapistId,
    this.therapistUrl,
    this.aboutTherapist,
    this.activityName,
    this.aboutActivity,
    this.date,
  });

  @override
  AboutActivityModel fromJson(Map<String, dynamic> json) =>
      AboutActivityModel.fromJson(json);

  factory AboutActivityModel.fromJson(Map<String, dynamic> json) =>
      _$AboutActivityModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AboutActivityModelToJson(this);

  @override
  List<Object?> get props => [
        therapistName,
        therapistId,
        therapistUrl,
        aboutTherapist,
        activityName,
        aboutActivity,
        date
      ];

  AboutActivityModel copyWith({
    String? therapistName,
    String? therapistId,
    String? therapistUrl,
    String? aboutTherapist,
    String? activityName,
    String? aboutActivity,
    String? date,
  }) {
    return AboutActivityModel(
      therapistName: therapistName ?? this.therapistName,
      therapistId: therapistId ?? this.therapistId,
      therapistUrl: therapistUrl ?? this.therapistUrl,
      aboutTherapist: aboutTherapist ?? this.aboutTherapist,
      activityName: activityName ?? this.activityName,
      aboutActivity: aboutActivity ?? this.aboutActivity,
      date: date ?? this.date,
    );
  }
}
