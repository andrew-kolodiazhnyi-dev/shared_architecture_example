import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'data.g.dart';

@JsonSerializable(createToJson: false, anyMap: true)
class Data {
  @JsonKey(name: 'RelatedTopics')
  final List<Item> items;

  Data(this.items);

  factory Data.fromJson(Map<dynamic, dynamic> json) => _$DataFromJson(json);
}
