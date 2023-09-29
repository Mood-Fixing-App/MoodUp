// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostListModel _$PostListModelFromJson(Map<String, dynamic> json) =>
    PostListModel(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostListModelToJson(PostListModel instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };
