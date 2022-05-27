import 'package:bwa_airplane/models/destination_model.dart';
import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

import '../pages/detail_page.dart';

class CustomDestinationTile extends StatelessWidget {
  final DestinationModel destination;
  const CustomDestinationTile(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(destination),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultBorder,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  defaultBorder,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destination.imgUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(destination.city,
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(
                    right: 2,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/icon_star.png',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    destination.rating.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
