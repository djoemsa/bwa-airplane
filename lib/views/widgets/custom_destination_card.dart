import 'package:bwa_airplane/models/destination_model.dart';
import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

import '../pages/detail_page.dart';

class CustomDestinationCard extends StatelessWidget {
  final DestinationModel destination;
  const CustomDestinationCard(
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
        width: 200,
        height: 323,
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultBorder,
          ),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 180,
                height: 220,
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    defaultBorder,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      destination.imgUrl,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 55,
                    height: 30,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          defaultBorder,
                        ),
                      ),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        destination.city,
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
