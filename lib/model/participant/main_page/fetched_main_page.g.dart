// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetched_main_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchedMainPage _$FetchedMainPageFromJson(Map<String, dynamic> json) =>
    FetchedMainPage(
      mainpage: (json['mainpage'] as List<dynamic>?)
          ?.map((e) => Mainpage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchedMainPageToJson(FetchedMainPage instance) =>
    <String, dynamic>{
      'mainpage': instance.mainpage,
    };
