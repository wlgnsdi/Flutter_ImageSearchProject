// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDocument _$ImageDocumentFromJson(Map<String, dynamic> json) =>
    ImageDocument(
      collection: json['collection'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      imageUrl: json['image_url'] as String?,
      displaySitename: json['display_sitename'] as String?,
      docUrl: json['doc_url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      dateTime: json['datetime'] as String?,
    );

Map<String, dynamic> _$ImageDocumentToJson(ImageDocument instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'thumbnail_url': instance.thumbnailUrl,
      'image_url': instance.imageUrl,
      'display_sitename': instance.displaySitename,
      'doc_url': instance.docUrl,
      'width': instance.width,
      'height': instance.height,
      'datetime': instance.dateTime,
    };
