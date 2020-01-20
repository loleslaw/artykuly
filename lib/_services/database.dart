import 'package:firebase_database/firebase_database.dart';

class Database {

  final DatabaseReference artykuly = FirebaseDatabase.instance.reference().child('test');
  
  Future<void> readArticles () async {
    DataSnapshot ds = await artykuly.once();
    if (ds.)
    print(ds);

  }
  
}