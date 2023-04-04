import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answers.g.dart';

@JsonSerializable()
class Answers extends INetworkModel<Answers> with EquatableMixin {
  int? id;
  int? response;

  Answers({
    this.id,
    this.response,
  });

  @override
  Answers fromJson(Map<String, dynamic> json) => Answers.fromJson(json);

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AnswersToJson(this);

  @override
  List<Object?> get props => [id, response];

  Answers copyWith({
    int? id,
    int? response,
  }) {
    return Answers(
      id: id ?? this.id,
      response: response ?? this.response,
    );
  }
}
