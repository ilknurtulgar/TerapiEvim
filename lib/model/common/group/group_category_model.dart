import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'group_category_model.g.dart';

@JsonSerializable()
class GroupCategoryModel extends INetworkModel<GroupCategoryModel> {
  String groupCategory;

  @JsonKey(includeToJson: false)
  String participantId;

  GroupCategoryModel({
    required this.groupCategory,
    required this.participantId,
  });

  @override
  GroupCategoryModel fromJson(Map<String, dynamic> json) =>
      GroupCategoryModel.fromJson(json);

  factory GroupCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$GroupCategoryModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$GroupCategoryModelToJson(this);
}
