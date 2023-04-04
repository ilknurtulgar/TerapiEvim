import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'about_me_model.g.dart';

@JsonSerializable()
class AboutMeModel extends INetworkModel<AboutMeModel> {
  String? aboutMe;

  AboutMeModel({
    this.aboutMe,
  });

  @override
  AboutMeModel fromJson(Map<String, dynamic> json) =>
      AboutMeModel.fromJson(json);

  factory AboutMeModel.fromJson(Map<String, dynamic> json) =>
      _$AboutMeModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AboutMeModelToJson(this);
}
