import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'dealing_method_model.g.dart';

@JsonSerializable()
class DealingMethodModel extends INetworkModel<DealingMethodModel>
    with EquatableMixin {
  String? name;
  String? avatarUrl;
  String? date;
  String? description;
  String? docUrl;
  String? id;

  DealingMethodModel({
    this.name,
    this.avatarUrl,
    this.date,
    this.description,
    this.docUrl,
    this.id,
  });

  @override
  DealingMethodModel fromJson(Map<String, dynamic> json) =>
      DealingMethodModel.fromJson(json);

  factory DealingMethodModel.fromJson(Map<String, dynamic> json) =>
      _$DealingMethodModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DealingMethodModelToJson(this);

  @override
  List<Object?> get props => [name, avatarUrl, date, description, docUrl, id];

  DealingMethodModel copyWith({
    String? name,
    String? avatarUrl,
    String? date,
    String? description,
    String? docUrl,
    String? id,
  }) {
    return DealingMethodModel(
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      date: date ?? this.date,
      description: description ?? this.description,
      docUrl: docUrl ?? this.docUrl,
      id: id ?? this.id,
    );
  }
}
