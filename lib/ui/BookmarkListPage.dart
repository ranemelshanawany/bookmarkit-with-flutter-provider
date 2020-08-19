import 'package:bookmark_list_app/BookmarkProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DetailsScreen.dart';
import '../data/bookmark.dart';

class BookmarkListPage extends StatefulWidget {
  @override
  _BookmarkListPageState createState() => _BookmarkListPageState();
}

class _BookmarkListPageState extends State<BookmarkListPage> {
  List<Bookmark> _bookmarks = List<Bookmark>();
  bool dataLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: _bookmarks == null ? 0 : _bookmarks.length,
      itemBuilder: (context, index) {
        return _buildListItem(index);
      },
    );
  }

  @override
  void initState() {
    super.initState();

    Provider.of<BookmarkProvider>(context, listen: false)
        .fetchBookmark()
        .then((value) {
      setState(() {
        _bookmarks.addAll(value);
        dataLoaded = true;
      });
    });
  }

  _buildListItem(int index) {
    return Container(
      height: 200,
      child: Card(
          child: InkWell(
        onTap: () {
          openNewsPage(index);
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildText(index),
              _buildImage(index),
            ],
          ),
        ),
      )),
    );
  }

  _buildText(int index) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTitle(_bookmarks[index].title),
            _buildDescription(_bookmarks[index].description),
          ],
        ),
      ),
    );
  }

  _buildTitle(String title) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  _buildDescription(String description) {
    return Text(description,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontSize: 15, color: Colors.grey));
  }

  _buildImage(int index) {
    return Container(
        padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(_bookmarks[index].urlToImage,
              width: 150, height: 150, fit: BoxFit.cover),
        ));
  }

  openNewsPage(int index) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(bookmark: _bookmarks[index]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
