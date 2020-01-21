import 'dart:async';

import 'package:flutter/material.dart';

import '../_model/artylul.dart';
import '../_services/database.dart';

class HomePage extends StatefulWidget {

 

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Artykul> articles = List<Artykul>();
  bool dataLoading = false;
  StreamSubscription _subscription;
  @override
  void initState() { 
    super.initState();
    setState(() {
      dataLoading = true;
    });
    // Database.getArticles().then((data) {
    //   articles = data;
    //   // articles.forEach((article) {
    //   //   print('sub: ${article.title}');
    //   // });
    // });
    Database.getArtykulsStream(_updateArticles)
      .then((StreamSubscription s ) => _subscription = s);
    setState(() {
      dataLoading = false;
    });
  }

  void _updateArticles(List<Artykul> artykuly) {
    setState(() {
      articles = artykuly; 
    });
     
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artykuły'),
        centerTitle: true,
      ),
      body: dataLoading
        ? CircularProgressIndicator()
        : ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 2,) ,
          itemCount: articles.length,
          itemBuilder: _buildItemTile,
        ),
    );
  }
  Widget _buildItemTile(BuildContext context, int index) {
    return ListTile(title: Text(articles[index].title, style: TextStyle(fontSize: 16),),);
  }



}

