import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'business/bookmark_provider.dart';
import 'ui/bookmark_list_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BookmarkProvider>.value(value: BookmarkProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bookmarks List")),
        body: BookmarkListPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
