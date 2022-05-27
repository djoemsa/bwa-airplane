import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class CustomDetailPhoto extends StatelessWidget {
  final String assetsURL;
  const CustomDetailPhoto({
    Key? key,
    required this.assetsURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorder),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            assetsURL,
          ),
        ),
      ),
    );
  }
}
