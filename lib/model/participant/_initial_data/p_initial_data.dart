import 'package:json_annotation/json_annotation.dart';

import '../../../../core/managers/firebase/firestore/interface/i_network_model.dart';

part 'p_initial_data.g.dart';

@JsonSerializable()
class PInitialData extends INetworkModel<PInitialData> {
  String? joinedGroupId, shortCallSessionId;
  bool? isJoinedGroupLocked;

  /// The category is defined by a therapist in a session
  String? groupCategory;
  bool? isScl90Submitted;

  /// It will be completed after participant has a session with therapist
  bool? isSessionComplete;

  bool? isTestResultReady, isSessionSelected;

  PInitialData({
    this.joinedGroupId,
    this.shortCallSessionId,
    this.isJoinedGroupLocked,
    this.groupCategory,
    this.isScl90Submitted,
    this.isSessionComplete,
    this.isTestResultReady,
    this.isSessionSelected,
  });

  @override
  PInitialData fromJson(Map<String, dynamic> json) =>
      PInitialData.fromJson(json);

  factory PInitialData.fromJson(Map<String, dynamic> json) =>
      _$PInitialDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PInitialDataToJson(this);
}
