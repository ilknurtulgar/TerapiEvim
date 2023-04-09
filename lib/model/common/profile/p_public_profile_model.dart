import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'p_public_profile_model.g.dart';

@JsonSerializable()
class PPublicProfile extends INetworkModel<PPublicProfile> {
  String? id, name, imageUrl;

  PPublicProfile({
    this.id,
    this.name,
    this.imageUrl,
  });

  @override
  PPublicProfile fromJson(Map<String, dynamic> json) =>
      PPublicProfile.fromJson(json);

  factory PPublicProfile.fromJson(Map<String, dynamic> json) =>
      _$PPublicProfileFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PPublicProfileToJson(this);
}
