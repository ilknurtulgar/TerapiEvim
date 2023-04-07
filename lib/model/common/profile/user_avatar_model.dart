import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'user_avatar_model.g.dart';

@JsonSerializable()
class UserAvatarModel extends INetworkModel<UserAvatarModel> {
  String? imageUrl;

  UserAvatarModel({this.imageUrl});

  @override
  UserAvatarModel fromJson(Map<String, dynamic> json) =>
      UserAvatarModel.fromJson(json);

  factory UserAvatarModel.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserAvatarModelToJson(this);
}
