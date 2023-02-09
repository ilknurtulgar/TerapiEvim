import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mainpage.g.dart';

@JsonSerializable()
class Mainpage extends INetworkModel<Mainpage> with EquatableMixin {
  String? username;
  String? avatarUrl;
  String? usertitle;
  String? description;
  String? id;

  Mainpage({
    this.username,
    this.avatarUrl,
    this.usertitle,
    this.description,
    this.id,
  });

  @override
  Mainpage fromJson(Map<String, dynamic> json) => Mainpage.fromJson(json);

  factory Mainpage.fromJson(Map<String, dynamic> json) =>
      _$MainpageFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MainpageToJson(this);

  @override
  List<Object?> get props => [username, avatarUrl, usertitle, description, id];

  Mainpage copyWith({
    String? username,
    String? avatarUrl,
    String? usertitle,
    String? description,
    String? id,
  }) {
    return Mainpage(
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      usertitle: usertitle ?? this.usertitle,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}
