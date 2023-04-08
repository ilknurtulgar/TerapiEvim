import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import 't_group_model.dart';

part 't_about_group_model.g.dart';

@JsonSerializable()
class TAboutGroupModel extends INetworkModel<TAboutGroupModel> {
  String? id,
      groupName,
      therapistId,
      therapistName,
      aboutTherapist,
      therapistImageUrl;

  List<TGroupModel>? listOfHelpingGroups;

  TAboutGroupModel({
    this.id,
    this.groupName,
    this.therapistId,
    this.therapistName,
    this.aboutTherapist,
    this.therapistImageUrl,
    this.listOfHelpingGroups,
  });

  @override
  TAboutGroupModel fromJson(Map<String, dynamic> json) =>
      TAboutGroupModel.fromJson(json);

  factory TAboutGroupModel.fromJson(Map<String, dynamic> json) =>
      _$TAboutGroupModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TAboutGroupModelToJson(this);
}
