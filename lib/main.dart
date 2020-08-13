import 'package:flutter/material.dart';
import 'bookmark_class.dart';
import 'data.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bookmarks List")),
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bookmark> bookmarkList = new List(MyData.count);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < MyData.count; i++) {
      bookmarkList[i] = MyData.getBookmark(i);
    }

    return ListView.builder(
      itemCount: bookmarkList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(bookmark: bookmarkList[index]),
                    ),
                  );
                },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            bookmarkList[index].title,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          Text(bookmarkList[index].description,
                              style: TextStyle(fontSize: 15, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset( "assets/" +
                            MyData.imageName[index],
                          width: 170,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ),
            ],
          ),
                ),
              )),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Bookmark bookmark;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.bookmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(bookmark.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text(bookmark.description, style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}