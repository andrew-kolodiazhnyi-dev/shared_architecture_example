// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      firstUrl: json['FirstURL'] as String,
      icon: IconModel.fromJson(json['Icon'] as Map<String, dynamic>),
      result: json['Result'] as String,
      text: json['Text'] as String,
    );
