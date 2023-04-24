import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'is_diploma_uploaded_model.g.dart';

@JsonSerializable()
class IsDiplomaUploadedModel extends INetworkModel<IsDiplomaUploadedModel> {
  bool? isDiplomaUploaded;

  IsDiplomaUploadedModel({
    this.isDiplomaUploaded,
  });

  @override
  IsDiplomaUploadedModel fromJson(Map<String, dynamic> json) =>
      IsDiplomaUploadedModel.fromJson(json);

  factory IsDiplomaUploadedModel.fromJson(Map<String, dynamic> json) =>
      _$IsDiplomaUploadedModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$IsDiplomaUploadedModelToJson(this);
}
