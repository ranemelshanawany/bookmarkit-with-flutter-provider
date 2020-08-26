import 'dart:convert';
import 'bookmark.dart';
import 'package:http/http.dart' as http;

class BookmarksAPI {
  final String baseUrl = "http://newsapi.org/v2/everything?";
  final String url = 'domains=wsj.com&apiKey=';
  final String apiKey = "eb9535af01634676a4492abdb5b6c3b4";

  Future<List<Bookmark>> fetchBookmark() async {
    var response = await http.get(baseUrl + url + apiKey);
    var bookmarks = List<Bookmark>();

    if (response.statusCode == 200) {
      var bookmarksJson = json.decode(response.body)['articles'];
      for (var bookmarkJson in bookmarksJson) {
        bookmarks.add(Bookmark.fromJson(bookmarkJson));
      }
    } else {
      print("Could not fetch api");
    }
    return bookmarks;
  }
}
