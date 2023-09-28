import 'package:json_annotation/json_annotation.dart';
import 'package:moodup/src/features/post/models/post_model.dart';


part 'postlist_model.g.dart';

@JsonSerializable()
class PostListModel {
  List<Post>? posts;

  PostListModel({
    this.posts,
  });

  factory PostListModel.fromJson(Map<String, dynamic> json) =>
      _$PostListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostListModelToJson(this);
}
