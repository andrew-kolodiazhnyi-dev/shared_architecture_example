import 'package:json_annotation/json_annotation.dart';

import 'icon.dart';

part 'item.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal, createToJson: false)
class Item {
  @JsonKey(name: 'FirstURL')
  final String firstUrl;
  final IconModel icon;
  final String result;
  final String text;

  Item({
    required this.firstUrl,
    required this.icon,
    required this.result,
    required this.text,
  });

  const Item.empty()
      : firstUrl = '',
        icon = const IconModel(''),
        result = '',
        text = '';

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
