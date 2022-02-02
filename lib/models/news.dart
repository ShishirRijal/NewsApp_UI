import 'package:flutter/material.dart';

class News {
  final String imageAddress;
  // final Color color;
  final String title;
  final String text;
  final DateTime date;
  final int read;

  const News({
    required this.imageAddress,
    // required this.color,
    required this.title,
    required this.text,
    required this.date,
    required this.read,
  });
}
