import 'package:image_search_project/domain/image_document.dart';
import 'package:image_search_project/domain/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part "base_response.g.dart";

// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable(
    genericArgumentFactories: true, fieldRename: FieldRename.snake)
class BaseResponse {
  @JsonKey(name: 'meta')
  final Meta? meta;
  @JsonKey(name: 'documents')
  final List<ImageDocument>? imageDocument;

  BaseResponse({this.meta, this.imageDocument});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);


}
