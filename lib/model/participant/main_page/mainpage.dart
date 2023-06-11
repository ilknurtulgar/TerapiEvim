import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
part 'mainpage.g.dart';

@JsonSerializable()
class MainPage extends INetworkModel<MainPage> with EquatableMixin  {
  String? username;
  String? avatarUrl;
  String? usertitle;
  String? description;
  String? id;

  MainPage({
    this.username,
    this.avatarUrl,
    this.usertitle,
    this.description,
    this.id,
  });

  @override
  MainPage fromJson(Map<String, dynamic> json) => MainPage.fromJson(json);

  factory MainPage.fromJson(Map<String, dynamic> json) =>
      _$MainpageFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MainpageToJson(this);

  @override
  List<Object?> get props => [username, avatarUrl, usertitle, description, id];

  MainPage copyWith({
    String? username,
    String? avatarUrl,
    String? usertitle,
    String? description,
    String? id,
  }) {
    return MainPage(
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      usertitle: usertitle ?? this.usertitle,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}
