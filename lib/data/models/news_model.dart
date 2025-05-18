// class NewsModel {
//   final String status;
//   final int totalResults;
//   final List<News> articles;

//   NewsModel({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });

//   factory NewsModel.fromJson(Map<String, dynamic> json) {
//     return NewsModel(
//       status: json['status'],
//       totalResults: json['totalResults'],
//       articles: (json['articles'] as List)
//           .map((articleJson) => News.fromJson(articleJson))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'totalResults': totalResults,
//       'articles': articles.map((article) => article.toJson()).toList(),
//     };
//   }
// }

// class News {
//   final Source source;
//   final String? author;
//   final String title;
//   final String? description;
//   final String url;
//   final String? urlToImage;
//   final DateTime publishedAt;
//   final String? content;

//   News({
//     required this.source,
//     this.author,
//     required this.title,
//     this.description,
//     required this.url,
//     this.urlToImage,
//     required this.publishedAt,
//     this.content,
//   });

//   factory News.fromJson(Map<String, dynamic> json) {
//     return News(
//       source: Source.fromJson(json['source']),
//       author: json['author'],
//       title: json['title'],
//       description: json['description'],
//       url: json['url'],
//       urlToImage: json['urlToImage'],
//       publishedAt: DateTime.parse(json['publishedAt']),
//       content: json['content'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'source': source.toJson(),
//       'author': author,
//       'title': title,
//       'description': description,
//       'url': url,
//       'urlToImage': urlToImage,
//       'publishedAt': publishedAt.toIso8601String(),
//       'content': content,
//     };
//   }
// }

// class Source {
//   final String? id;
//   final String name;

//   Source({
//     this.id,
//     required this.name,
//   });

//   factory Source.fromJson(Map<String, dynamic> json) {
//     return Source(
//       id: json['id'],
//       name: json['name'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }

class NewsResponseModel {
  final String status;
  final int totalResults;
  final List<NewsModel> news;

  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.news,
  });
  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      news:
          (json['articles'] as List)
              .map((element) => NewsModel.fromJson(element))
              .toList(),
    );
  }
}

class NewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  NewsModel({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
