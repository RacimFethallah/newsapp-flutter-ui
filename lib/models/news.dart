import 'package:newsapp/models/categories.dart';

class News {
  final String source;
  final String author;
  final String title;
  final String? description;
  final Categories category;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

   News({
    required this.source,
    required this.author,
    required this.title,
    this.description,
    required this.category,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });
}
