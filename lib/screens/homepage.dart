import 'package:flutter/material.dart';
import 'package:news_app_ui/models/news.dart';
import 'package:news_app_ui/utils/constants.dart';
import 'package:news_app_ui/utils/dummy_news.dart';
import 'package:news_app_ui/utils/news_tile.dart';
import 'package:news_app_ui/widgets/clickable_text.dart';
import 'package:news_app_ui/widgets/header.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTrendingSelected = false;
  bool isBookmarkSelected = false;
  bool isFeaturedSelected = true;
  List<News> bookmarkedNews = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const MyHeader(),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: const [
                      SizedBox(width: 10.0),
                      Icon(Icons.search, size: 30.0, color: Colors.black87),
                      SizedBox(width: 10.0),
                      Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClickableText(
                          title: 'Featured',
                          isActive: isFeaturedSelected,
                          handleClick: () {
                            setState(() {
                              isFeaturedSelected = true;
                              isBookmarkSelected = false;
                              isTrendingSelected = false;
                            });
                          }),
                      ClickableText(
                          title: 'Trending',
                          isActive: isTrendingSelected,
                          handleClick: () {
                            setState(() {
                              isFeaturedSelected = false;
                              isBookmarkSelected = false;
                              isTrendingSelected = true;
                            });
                          }),
                      ClickableText(
                          title: 'Bookmarked',
                          isActive: isBookmarkSelected,
                          handleClick: () {
                            setState(() {
                              isFeaturedSelected = false;
                              isBookmarkSelected = true;
                              isTrendingSelected = false;
                            });
                          }),
                    ],
                  ),
                ),

                // Featured Screen
                if (isFeaturedSelected)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var currentNews = dummyNews[index];
                      return NewsTile(
                        id: currentNews.id,
                        imageAddress: currentNews.imageAddress,
                        title: currentNews.title,
                        text: currentNews.text,
                        date: DateFormat.MMMd().format(currentNews.date),
                        read: currentNews.read,
                        bookmarkedNews: bookmarkedNews,
                      );
                    },
                    itemCount: dummyNews.length,
                  ),

                if (isBookmarkSelected)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var currentNews = bookmarkedNews[index];
                      return NewsTile(
                        id: currentNews.id,
                        imageAddress: currentNews.imageAddress,
                        title: currentNews.title,
                        text: currentNews.text,
                        date: DateFormat.MMMd().format(currentNews.date),
                        read: currentNews.read,
                        bookmarkedNews: bookmarkedNews,
                      );
                    },
                    itemCount: bookmarkedNews.length,
                  ),
                if (isTrendingSelected)
                  Center(
                    child: Text("Coming Soon", style: kTitleText),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
