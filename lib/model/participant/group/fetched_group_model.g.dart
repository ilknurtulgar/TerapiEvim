// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetched_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchedGroupModel _$FetchedGroupModelFromJson(Map<String, dynamic> json) =>
    FetchedGroupModel(
      approaching: (json['approaching'] as List<dynamic>?)
          ?.map((e) => Approaching.fromJson(e as Map<String, dynamic>))
          .toList(),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Participants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchedGroupModelToJson(FetchedGroupModel instance) =>
    <String, dynamic>{
      'approaching': instance.approaching,
      'participants': instance.participants,
    };
