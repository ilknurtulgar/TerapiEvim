// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetched_activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchedActivitiesModel _$FetchedActivitiesModelFromJson(
        Map<String, dynamic> json) =>
    FetchedActivitiesModel(
      approaching: (json['approaching'] as List<dynamic>?)
          ?.map((e) => ActivitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      past: (json['past'] as List<dynamic>?)
          ?.map((e) => ActivitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchedActivitiesModelToJson(
        FetchedActivitiesModel instance) =>
    <String, dynamic>{
      'approaching': instance.approaching,
      'past': instance.past,
    };
