import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import 'answers.dart';

part 'test_scl_90_model.g.dart';

@JsonSerializable()
class TestSCL90Model extends INetworkModel<TestSCL90Model> {
  String? id, participantId;
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
}
