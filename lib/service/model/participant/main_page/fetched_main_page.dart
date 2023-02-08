import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'mainpage.dart';
part 'fetched_main_page.g.dart';

@JsonSerializable()
class FetchedMainPage extends INetworkModel<FetchedMainPage>
    with EquatableMixin {
  List<Mainpage>? mainpage;

  FetchedMainPage({
    this.mainpage,
  });

  @override
  FetchedMainPage fromJson(Map<String, dynamic> json) =>
      FetchedMainPage.fromJson(json);

  factory FetchedMainPage.fromJson(Map<String, dynamic> json) =>
      _$FetchedMainPageFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FetchedMainPageToJson(this);

  @override
  List<Object?> get props => [mainpage];

  FetchedMainPage copyWith({
    List<Mainpage>? mainpage,
  }) {
    return FetchedMainPage(
      mainpage: mainpage ?? this.mainpage,
    );
  }
}
