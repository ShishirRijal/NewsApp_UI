import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  const BorderBox({
    Key? key,
    required this.icon,
    this.label,
    required this.handleClick,
  }) : super(key: key);
  final IconData icon;
  final Function() handleClick;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleClick,
      child: Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-3, 2),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.black,
          semanticLabel: label ?? '',
        ),
      ),
    );
  }
}
