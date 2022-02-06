import 'package:flutter/material.dart';
import 'package:news_app_ui/models/news.dart';
import 'package:news_app_ui/utils/constants.dart';
import 'package:news_app_ui/utils/dummy_news.dart';
import 'package:news_app_ui/widgets/border_box.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen(
      {Key? key,
      required this.id,
      required this.imageAddress,
      required this.title,
      required this.text,
      required this.bookmarkedNews})
      : super(key: key);
  final String id;
  final String imageAddress;
  final String title;
  final String text;
  final List<News> bookmarkedNews;
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final currentNews = dummyNews.firstWhere((news) => news.id == widget.id);
    bool isBookmarked = widget.bookmarkedNews.contains(currentNews);
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    height: mediaQuery.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.imageAddress),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          icon: Icons.arrow_back_ios,
                          label: 'Back',
                          handleClick: () => Navigator.pop(context),
                        ),
                        BorderBox(
                          icon: isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          label: 'Read Later',
                          handleClick: () {
                            if (isBookmarked) {
                              setState(() {
                                widget.bookmarkedNews.remove(currentNews);
                                isBookmarked = false;
                              });
                            } else {
                              setState(() {
                                widget.bookmarkedNews.add(currentNews);
                                isBookmarked = true;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: mediaQuery.width * 0.40,
                    bottom: 10,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(8.0),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      child: const Text("Read All", style: kTitleText),
                      onPressed: () {
                        ///
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: kActiveTitleText,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
