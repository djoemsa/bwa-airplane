import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class CustomInterestItem extends StatelessWidget {
  final String title;
  const CustomInterestItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/icon_checked.png'))),
          ),
          Text(title, style: primaryTextStyle),
        ],
      ),
    );
  }
}
