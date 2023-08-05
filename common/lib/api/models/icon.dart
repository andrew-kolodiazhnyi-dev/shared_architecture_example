import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: false)
class IconModel {
  final String url;

  const IconModel(this.url);

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);
}
