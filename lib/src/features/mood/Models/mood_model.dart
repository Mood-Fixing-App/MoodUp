class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List).map((article) => Article.fromJson(article)).toList(),
    );
  }
}

class Article {

  String author;
  String publishedAt;
  String content;

  Article({
    required this.author,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}