import 'package:json_annotation/json_annotation.dart';

import '../interface/i_network_model.dart';
part 'created_id_response.g.dart';

@JsonSerializable()
class CreatedIdResponse extends INetworkModel<CreatedIdResponse> {
  String? id;

  CreatedIdResponse({
    this.id,
  });

  @override
  CreatedIdResponse fromJson(Map<String, dynamic> json) =>
      CreatedIdResponse.fromJson(json);

  factory CreatedIdResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatedIdResponseFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CreatedIdResponseToJson(this);
}
