import 'package:flutter/material.dart';
import 'package:news_app_ui/models/news.dart';
import 'package:news_app_ui/screens/news_detail.dart';
import 'package:news_app_ui/utils/constants.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {Key? key,
      required this.id,
      required this.imageAddress,
      required this.title,
      required this.text,
      required this.date,
      required this.read,
      required this.bookmarkedNews})
      : super(key: key);
  final String id;
  final String imageAddress;
  final String title;
  final String date;
  final String text;
  final int read;
  final List<News> bookmarkedNews;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NewsDetailScreen(
              id: id,
              imageAddress: imageAddress,
              title: title,
              text: text,
              bookmarkedNews: bookmarkedNews,
            );
          }),
        );
      },
      child: Container(
        // width: mediaQuery.size.width * 0.8,
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageAddress,
                ),
              )),
              height: 120.0,
              width: mediaQuery.size.width * 0.4,
            ),
            const SizedBox(
              width: 20.0,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 120.0,
              width: mediaQuery.size.width * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: sized_box_for_whitespace
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: kTitleText,
                    maxLines: 4,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
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
                        color: Colors.black87,
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
