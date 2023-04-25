import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_confirmation_model.g.dart';

@JsonSerializable()
class ConfirmationModel extends INetworkModel<ConfirmationModel> {
  String? id, therapistId, uploadedPdfUrl;
  bool? isConfirmed;

  /// pickedPdfPath is required
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? pickedPdfPath;

  ConfirmationModel({
    this.id,
    this.therapistId,
    this.uploadedPdfUrl,
    this.isConfirmed,
    this.pickedPdfPath,
  });

  @override
  ConfirmationModel fromJson(Map<String, dynamic> json) =>
      ConfirmationModel.fromJson(json);

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ConfirmationModelToJson(this);
}
