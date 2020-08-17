import 'dart:convert';

import 'bookmark.dart';
import 'package:http/http.dart' as http;

class BookmarksAPI
{
  final String url =
      'http://newsapi.org/v2/everything?q=apple&from=2020-08-13&to=2020-08-13&sortBy=popularity&apiKey=eb9535af01634676a4492abdb5b6c3b4';

  Future<List<Bookmark>> fetchBookmark() async {
    var response = await http.get(url);
    var bookmarks = List<Bookmark>();

    if (response.statusCode == 200) {
      //return parseBookmarks(response.body);
      var bookmarksJson = json.decode(response.body)['articles'];
      for (var bookmarkJson in bookmarksJson) {
        bookmarks.add(Bookmark.fromJson(bookmarkJson));
      }
    }
    return bookmarks;
  }
}