import 'bookmark_class.dart';

class MyData {

  static int count = 8;
  static var titles = ["Netflix, Give Us the ‘Community’ Movie We Deserve",
    "20% More Emperor Penguin Colonies in Antarctica Than Previously Thought",
    "Chernobyl Fungus Could Be Grown On Rockets to Protect Astronauts",
    "title here title here title here title here title here",
    "title here title here title here title here title here",
    "title here title here title here title here title here",
    "title here title here title here title here title here",
    "title here title here title here title here title here"];
  static var description = ["All of Community hits Netflix April 1—and this is not joke",
    "11 new breeding colonies found.",
    "A living shield to protect astronauts from toxic space radiation",
    "description4 description4 description4 description4",
    "description4 description4 description4 description4 ",
    "description4 description4 description4 description4 ",
    "description4 description4 description4 description4 ",
    "description4 description4 description4 description4 "];
  //static var link = ["https://observer.com/2020/04/community-dan-harmon-netflix-movie-sixseasonsandamovie-campaign/", "14 min read", "8 min read", "8 min read"];
  static var imageName = ["image1.jpeg","image2.jpeg","image3.jpeg","image4.jpeg","image4.jpeg","image4.jpeg","image4.jpeg","image4.jpeg"];

  static getBookmark(int position) {
    return Bookmark(titles[position], description[position], imageName[position]);
  }

}