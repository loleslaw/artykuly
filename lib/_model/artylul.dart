import 'package:firebase_database/firebase_database.dart';

class Artykul {
  final String id;
  final String category;
  final String title;
  final String url;

  Artykul(this.id, this.category, this.title, this.url);

  Artykul.fromSnapshot({String key, Map data}) 
    : id = key,
      category = data['category'] ?? '',
      title = data['title'] ?? '',
      url = data['url'] ?? '';

  toJson() {
    return {
      "category" : category,
      "title" : title,
      "url" : url
    };
  }
}