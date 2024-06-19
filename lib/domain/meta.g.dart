// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      query: json['query'] as String?,
      sort: json['sort'] as String?,
      page: json['page'] as String?,
      size: json['siz'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'query': instance.query,
      'sort': instance.sort,
      'page': instance.page,
      'siz': instance.size,
    };
