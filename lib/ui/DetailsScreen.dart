import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/bookmark.dart';

class DetailScreen extends StatelessWidget {
  final Bookmark bookmark;

  DetailScreen({Key key, @required this.bookmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network(bookmark.urlToImage, fit: BoxFit.cover),
            Text(
              bookmark.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              bookmark.description,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
