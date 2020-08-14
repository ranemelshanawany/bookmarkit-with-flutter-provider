import 'package:flutter/material.dart';
import 'bookmark_class.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';

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

    makeBookmarkList();

    return ListView.builder(
      itemCount: bookmarkList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          child: Card(
              child: InkWell(
                onTap: () {
                  _launchURL(bookmarkList[index].link);
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
  makeBookmarkList()
  {
    for (int i = 0; i < MyData.count; i++) {
      bookmarkList[i] = MyData.getBookmark(i);
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
