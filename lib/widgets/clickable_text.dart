import 'package:flutter/material.dart';
import 'package:news_app_ui/utils/constants.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    Key? key,
    required this.title,
    required this.handleClick,
    required this.isActive,
  }) : super(key: key);
  final String title;
  final Function() handleClick;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleClick,
      child: Text(
        title,
        style: isActive ? kActiveTitleText : kInactiveTitleText,
      ),
    );
  }
}
