import 'package:artykuly/_services/database.dart';
import 'package:flutter/material.dart';

import '_pages/homePage.dart';

//
//   https://www.youtube.com/watch?v=Bper2K92bd8
//




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
