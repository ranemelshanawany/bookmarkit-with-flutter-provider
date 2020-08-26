import 'package:flutter/cupertino.dart';
import '../data/bookmark.dart';
import '../data/bookmark_api.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Bookmark> bookmarks = new List();
  bool dataLoading = true;

  bool isLoading() {
    return dataLoading;
  }

  setData(List<Bookmark> data) {
    bookmarks = data;
    dataLoading = false;
    notifyListeners();
  }

  List<Bookmark> getData() {
    return bookmarks;
  }

  Future<List<Bookmark>> fetchBookmark() async {
    return BookmarksAPI().fetchBookmark();
  }
}
