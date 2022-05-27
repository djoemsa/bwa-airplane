import 'package:flutter/material.dart';
import '../../preferences/theme.dart';
import 'custom_interest_item.dart';

class CustomBookingDetails extends StatelessWidget {
  final String name;
  final String detail;
  final Color detailColor;
  const CustomBookingDetails({
    Key? key,
    required this.name,
    required this.detail,
    required this.detailColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          CustomInterestItem(title: name),
          Spacer(),
          Text(
            detail,
            style: primaryTextStyle.copyWith(
              color: detailColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
