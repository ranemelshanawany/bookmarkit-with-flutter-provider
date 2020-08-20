import '../business/BookmarkProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/bookmark.dart';
import 'ListItem.dart';

class BookmarkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getAPI(context);

    if (Provider.of<BookmarkProvider>(context).isLoading()) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: Provider.of<BookmarkProvider>(context).getData().length,
      itemBuilder: (context, index) {
        return ListItem.buildListItem(index, context);
      },
    );
  }

  getAPI(context) async {
    List<Bookmark> bookmarks =
        await Provider.of<BookmarkProvider>(context).fetchBookmark();
    Provider.of<BookmarkProvider>(context, listen: false).setData(bookmarks);
  }
}
