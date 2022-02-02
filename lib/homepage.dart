import 'package:flutter/material.dart';
import 'package:news_app_ui/constants.dart';
import 'package:news_app_ui/dummy_news.dart';
import 'package:news_app_ui/header.dart';
import 'package:intl/intl.dart';
import 'package:news_app_ui/news_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  height: 45.0,
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
                    children: const [
                      Text("Featured", style: kActiveTitleText),
                      Text("Latest", style: kInactiveTitleText),
                      Text("Trending", style: kInactiveTitleText),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var currentNews = dummyNews[index];
                    return NewsTile(
                      imageAddress: currentNews.imageAddress,
                      title: currentNews.title,
                      text: currentNews.text,
                      date: DateFormat.MMMd().format(currentNews.date),
                      read: currentNews.read,
                    );
                  },
                  itemCount: dummyNews.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
    required this.imageAddress,
    // required this.color,
    required this.title,
    required this.text,
    required this.date,
    required this.read,
  }) : super(key: key);
  // final Image thumbnail;
  final String imageAddress;
  // final Color color;
  final String title;
  final String date;
  final String text;
  final int read;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NewsDetailScreen(
                imageAddress: imageAddress, title: title, text: text);
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageAddress,
                ),
              )),
              height: 90.0,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    child: Text(
                      title,
                      style: kTitleText,
                      // softWrap: true,
                      // overflow: TextOverflow.fade,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        date.toString(),
                        style: kLabelText,
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.circle,
                        size: 10.0,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        '$read min',
                        style: kLabelText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
