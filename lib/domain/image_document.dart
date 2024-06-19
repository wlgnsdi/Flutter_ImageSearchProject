import 'package:json_annotation/json_annotation.dart';

part "image_document.g.dart";

// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable(
    genericArgumentFactories: true, fieldRename: FieldRename.snake)
class ImageDocument {
  @JsonKey(name: 'collection')
  final String? collection;
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'display_sitename')
  final String? displaySitename;
  @JsonKey(name: 'doc_url')
  final String? docUrl;
  @JsonKey(name: 'width')
  final int? width;
  @JsonKey(name: 'height')
  final int? height;
  @JsonKey(name: 'datetime')
  final String? dateTime;

  ImageDocument(
      {this.collection,
      this.thumbnailUrl,
      this.imageUrl,
      this.displaySitename,
      this.docUrl,
      this.width,
      this.height,
      this.dateTime});

  factory ImageDocument.fromJson(Map<String, dynamic> json) => _$ImageDocumentFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDocumentToJson(this);

  @override
  String toString() {
    return 'DateTime : $dateTime, ImageUrl : $imageUrl';
  }
}
