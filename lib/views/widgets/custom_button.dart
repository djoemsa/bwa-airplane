import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final double buttonWidth;
  final Function() onPressed;
  final EdgeInsets buttonMargin;
  const CustomButton({
    Key? key,
    required this.buttonName,
    this.buttonWidth = double.infinity,
    required this.onPressed,
    this.buttonMargin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: 55,
      margin: buttonMargin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultBorder),
            )),
        child: Text(
          buttonName,
          style: primaryTextStyle.copyWith(
            color: kWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
