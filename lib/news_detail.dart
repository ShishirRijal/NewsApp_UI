import 'package:flutter/material.dart';
import 'package:news_app_ui/constants.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    Key? key,
    required this.imageAddress,
    required this.title,
    required this.text,
  }) : super(key: key);
  final String imageAddress;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
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
                    image: NetworkImage(imageAddress),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.favorite_outline,
                            size: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
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
                      child: Text("Read All", style: kTitleText),
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
                      title,
                      style: kActiveTitleText,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      text,
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
