import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 't_initial_data.g.dart';

@JsonSerializable()
class TInitialData extends INetworkModel<TInitialData> {
  bool? isTherapistConfirmed;
  bool? isTherapistBeingReviewed;
  bool? isBeingAdvisorAccepted;
  int? maxNumberOfHelpingGroups;

  TInitialData({
    this.isTherapistConfirmed,
    this.isTherapistBeingReviewed,
    this.isBeingAdvisorAccepted,
    this.maxNumberOfHelpingGroups,
  });

  @override
  TInitialData fromJson(Map<String, dynamic> json) =>
      TInitialData.fromJson(json);

  factory TInitialData.fromJson(Map<String, dynamic> json) =>
      _$TInitialDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TInitialDataToJson(this);
}
