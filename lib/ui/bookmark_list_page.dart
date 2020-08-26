import '../business/bookmark_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/bookmark.dart';
import 'list_item.dart';

class BookmarkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookmarkProvider bookmarkProvider = Provider.of<BookmarkProvider>(context);
    if (bookmarkProvider.isLoading()) {
      getAPI(context);
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: bookmarkProvider.getData().length,
      itemBuilder: (context, index) {
        return ListItem.buildListItem(index, context, bookmarkProvider);
      },
    );
  }

  getAPI(context) async {
    List<Bookmark> bookmarks =
        await Provider.of<BookmarkProvider>(context).fetchBookmark();
    Provider.of<BookmarkProvider>(context, listen: false).setData(bookmarks);
  }
}
