import '../business/bookmark_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'details_screen.dart';

class ListItem {
  static buildListItem(int index, context, BookmarkProvider bookmarkProvider) {
    return Container(
      height: 200,
      child: Card(
          child: InkWell(
        onTap: () {
          openNewsPage(index, context, bookmarkProvider);
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildText(index, bookmarkProvider),
              _buildImage(index, bookmarkProvider),
            ],
          ),
        ),
      )),
    );
  }

  static _buildText(int index, BookmarkProvider bookmarkProvider) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTitle(
                bookmarkProvider.getData()[index].title),
            _buildDescription(bookmarkProvider.getData()[index]
                .description),
          ],
        ),
      ),
    );
  }

  static _buildTitle(String title) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  static _buildDescription(String description) {
    return Text(description,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontSize: 15, color: Colors.grey));
  }

  static _buildImage(int index, BookmarkProvider bookmarkProvider) {
    return Container(
        padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
              bookmarkProvider.getData()[index]
                  .urlToImage,
              width: 150,
              height: 150,
              fit: BoxFit.cover),
        ));
  }

  static openNewsPage(int index, context, BookmarkProvider bookmarkProvider) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
            bookmark: bookmarkProvider.getData()[index]),
      ),
    );
  }
}
