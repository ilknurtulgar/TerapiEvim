import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_public_profile_model.g.dart';

@JsonSerializable()
class TPublicProfile extends INetworkModel<TPublicProfile> {
  String? name, aboutMe, imageUrl;
  List<String>? helpingGroupsId;

  TPublicProfile({
    this.name,
    this.aboutMe,
    this.imageUrl,
    this.helpingGroupsId,
  });

  @override
  TPublicProfile fromJson(Map<String, dynamic> json) =>
      TPublicProfile.fromJson(json);

  factory TPublicProfile.fromJson(Map<String, dynamic> json) =>
      _$TPublicProfileFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TPublicProfileToJson(this);
}
