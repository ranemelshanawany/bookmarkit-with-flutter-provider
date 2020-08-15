class Bookmark
{
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  Bookmark(this.title, this.description, this.url, this.urlToImage, this.content);

  Bookmark.fromJson(Map<String, dynamic> json)
  {

    title= json['title'];
    description= json['description'];
    url= json['url'];
    urlToImage= json['urlToImage'];
    content= json['content'];

  }
}