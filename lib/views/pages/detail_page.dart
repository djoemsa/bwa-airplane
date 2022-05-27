import 'package:bwa_airplane/models/destination_model.dart';
import 'package:intl/intl.dart';

import '../pages/choose_seat_page.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_detail_photo.dart';
import '../widgets/custom_interest_item.dart';

import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              destination.imgUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget opacityShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // NOTE: emblem
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_emblem.png',
                  ),
                ),
              ),
            ),
            // NOTE: title
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: primaryTextStyle.copyWith(
                            color: kWhiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destination.city,
                          style: primaryTextStyle.copyWith(
                            color: kWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(
                            right: 4,
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
                              color: kWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ]),
                ],
              ),
            ),
            // NOTE: description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: about
                  Text(
                    'About',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: primaryTextStyle.copyWith(
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Photos',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      CustomDetailPhoto(
                        assetsURL: 'assets/images/image_dest_detail_01.png',
                      ),
                      CustomDetailPhoto(
                        assetsURL: 'assets/images/image_dest_detail_02.png',
                      ),
                      CustomDetailPhoto(
                        assetsURL: 'assets/images/image_dest_detail_03.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Interests',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      CustomInterestItem(title: 'Kids Park'),
                      CustomInterestItem(title: 'Honor Bridge'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CustomInterestItem(title: 'City Museum'),
                      CustomInterestItem(title: 'Central Mall'),
                    ],
                  )
                ],
              ),
            ),
            // NOTE: price & book button
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: Row(
                children: [
                  // NOTE: price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(
                            destination.price,
                          ),
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'per orang',
                          style: primaryTextStyle.copyWith(
                            color: kGreyColor,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                  // NOTE: book button
                  CustomButton(
                    buttonName: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(
                            destination,
                          ),
                        ),
                      );
                    },
                    buttonWidth: 170,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          opacityShadow(),
          SingleChildScrollView(child: content()),
        ],
      ),
    );
  }
}
