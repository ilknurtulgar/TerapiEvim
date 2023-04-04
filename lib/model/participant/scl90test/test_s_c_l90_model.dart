import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'answers.dart';
part 'test_s_c_l90_model.g.dart';

@JsonSerializable()
class TestSCL90Model extends INetworkModel<TestSCL90Model> with EquatableMixin {
  List<Answers>? answers;

  TestSCL90Model({
    this.answers,
  });

  @override
  TestSCL90Model fromJson(Map<String, dynamic> json) =>
      TestSCL90Model.fromJson(json);

  factory TestSCL90Model.fromJson(Map<String, dynamic> json) =>
      _$TestSCL90ModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TestSCL90ModelToJson(this);

  @override
  List<Object?> get props => [answers];

  TestSCL90Model copyWith({
    List<Answers>? answers,
  }) {
    return TestSCL90Model(
      answers: answers ?? this.answers,
    );
  }
}
