import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';
part 'error_model_custom.g.dart';

@JsonSerializable()
class ErrorModelCustom extends INetworkModel<ErrorModelCustom>
    with EquatableMixin {
  int? statusCode;
  dynamic message;

  ErrorModelCustom({
    this.statusCode,
    this.message,
  });

  @override
  ErrorModelCustom fromJson(Map<String, dynamic> json) =>
      ErrorModelCustom.fromJson(json);

  factory ErrorModelCustom.fromJson(Map<String, dynamic> json) {

   return _$ErrorModelCustomFromJson(json);

  }

  @override
  Map<String, dynamic>? toJson() => _$ErrorModelCustomToJson(this);

  @override
  List<Object?> get props => [statusCode, message];

  ErrorModelCustom copyWith({
    int? statusCode,
    dynamic message,
  }) {
    return ErrorModelCustom(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }
}
