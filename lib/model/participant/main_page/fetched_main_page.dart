import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/managers/firebase/firestore/interface/i_network_model.dart';
import 'mainpage.dart';

part 'fetched_main_page.g.dart';

@JsonSerializable()
class FetchedMainPage extends INetworkModel<FetchedMainPage>
    with EquatableMixin {
  List<MainPage>? mainPage;

  FetchedMainPage({
    this.mainPage,
  });

  @override
  FetchedMainPage fromJson(Map<String, dynamic> json) =>
      FetchedMainPage.fromJson(json);

  factory FetchedMainPage.fromJson(Map<String, dynamic> json) =>
      _$FetchedMainPageFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FetchedMainPageToJson(this);

  @override
  List<Object?> get props => [mainPage];

  FetchedMainPage copyWith({
    List<MainPage>? mainpage,
  }) {
    return FetchedMainPage(
      mainPage: mainpage ?? this.mainPage,
    );
  }
}
