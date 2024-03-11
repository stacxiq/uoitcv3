// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      date: json['date'] as String,
      content: json['content'] as String,
      section: json['section'] as String,
      views: json['views'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: json['files'] as List<dynamic>?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'date': instance.date,
      'content': instance.content,
      'section': instance.section,
      'views': instance.views,
      'images': instance.images,
      'files': instance.files,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      path: json['path'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'path': instance.path,
    };
