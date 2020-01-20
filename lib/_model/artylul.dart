import 'package:firebase_database/firebase_database.dart';

class Artykul {
  final String id;
  final String category;
  final String title;
  final String url;

  Artykul(this.id, this.category, this.title, this.url);

  Artykul.fromSnapshot(DataSnapshot data) 
    : id = data.key,
      category = data.value['category'],
      title = data.value['title'],
      url = data.value['url'];

  toJson() {
    return {
      "category" : category,
      "title" : title,
      "url" : url
    };
  }
}