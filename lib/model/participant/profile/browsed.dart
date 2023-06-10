import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
part 'browsed.g.dart';

@JsonSerializable()
class Browsed extends INetworkModel<Browsed> with EquatableMixin {
  String? methodTitle;
  String? id;

  Browsed({
    this.methodTitle,
    this.id,
  });

  @override
  Browsed fromJson(Map<String, dynamic> json) => Browsed.fromJson(json);

  factory Browsed.fromJson(Map<String, dynamic> json) =>
      _$BrowsedFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$BrowsedToJson(this);

  @override
  List<Object?> get props => [methodTitle, id];

  Browsed copyWith({
    String? methodTitle,
    String? id,
  }) {
    return Browsed(
      methodTitle: methodTitle ?? this.methodTitle,
      id: id ?? this.id,
    );
  }
}
