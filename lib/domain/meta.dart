import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable(
    genericArgumentFactories: true, fieldRename: FieldRename.snake)
class Meta {
  @JsonKey(name:'query')
  final String? query;

  @JsonKey(name:'sort')
  final String? sort;

  @JsonKey(name:'page')
  final String? page;

  @JsonKey(name:'siz')
  final String? size;

  Meta({this.query, this.sort, this.page, this.size});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);

  @override
  String toString() {
    return 'Page : $page, Size : $size';
  }
}