import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.menu, size: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Image(
              height: 60.0,
              width: 60.0,
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/profile.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
