import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../_model/artylul.dart';

final String artykulChild = 'test';

class Database {

  final DatabaseReference artykuly = FirebaseDatabase.instance.reference().child('test');
  
  static Future<List<Artykul>> getArticles () async {
    List<Artykul> artykuly = List<Artykul>();

    Completer<List<Artykul>> completer = Completer<List<Artykul>>();
    FirebaseDatabase.instance.reference().child(artykulChild)
    .once()
    .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> artykulMap = snapshot.value;
      artykulMap.forEach((key, value) {
        artykuly.add(Artykul.fromSnapshot(key: key, data: value));
      });

      completer.complete(artykuly);
    });
    return completer.future;
  }

  static Future<StreamSubscription<Event>> getArtykulsStream(void onData(List<Artykul> artykuly)) async {
    StreamSubscription<Event> subscription = FirebaseDatabase.instance
      .reference()
      .child(artykulChild)
      .onValue
      .listen((Event event) {
        List<Artykul> artykuly = List<Artykul>();
        Map<dynamic, dynamic> artykulyMap = event.snapshot.value;
        artykulyMap.forEach((key, value) {
          artykuly.add(Artykul.fromSnapshot(key: key, data: value));
        });
        onData(artykuly);
      });
    return subscription;
  }
  
}