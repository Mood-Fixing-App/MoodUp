import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: non_constant_identifier_names
part 'post_model.g.dart';

@JsonSerializable()
class Post {
  final String? id;
  final String? author;
  final String? content;
  final String? images;
  final int? likes;
  final int? comments;
  final String? created_at;
  final String? updated_at;

  Post({
    this.id,
    this.author,
    this.content,
    this.images,
    this.likes,
    this.comments,
    this.created_at,
    this.updated_at,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);


}
