import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'max_number_of_groups_model.g.dart';

@JsonSerializable()
class MaxNumberOfGroupsModel extends INetworkModel<MaxNumberOfGroupsModel> {
  String? maxNumberOfHelpingGroups;

  MaxNumberOfGroupsModel({
    this.maxNumberOfHelpingGroups,
  });

  @override
  MaxNumberOfGroupsModel fromJson(Map<String, dynamic> json) =>
      MaxNumberOfGroupsModel.fromJson(json);

  factory MaxNumberOfGroupsModel.fromJson(Map<String, dynamic> json) =>
      _$MaxNumberOfGroupsModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MaxNumberOfGroupsModelToJson(this);
}
