// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      images: json['images'] as String?,
      likes: json['likes'] as int?,
      comments: json['comments'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'images': instance.images,
      'likes': instance.likes,
      'comments': instance.comments,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
