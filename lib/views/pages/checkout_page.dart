// import 'dart:html';

import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:bwa_airplane/logics/cubit/transaction_cubit.dart';
import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:bwa_airplane/views/pages/success_checkout_page.dart';
import 'package:bwa_airplane/views/widgets/custom_booking_details_item.dart';
import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../preferences/theme.dart';
import '../widgets/custom_interest_item.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Ciliwung',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorder),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: destination tile
            Row(
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
                      // fit: BoxFit.cover,
                      image: NetworkImage(
                        transaction.destination.imgUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(transaction.destination.city,
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
                        transaction.destination.rating.toString(),
                        style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // NOTE: booking details
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // NOTE: booking details items
            CustomBookingDetails(
              name: 'Traveler',
              detail: '${transaction.amountOfTraveler} Persons',
              detailColor: kBlackColor,
            ),
            CustomBookingDetails(
              name: 'Seat',
              detail: transaction.selectedSeats,
              detailColor: kBlackColor,
            ),

            CustomBookingDetails(
              name: 'Insurance',
              detail: transaction.insurance ? 'YES' : 'NO',
              detailColor: transaction.insurance ? kYesColor : kNoColor,
            ),
            CustomBookingDetails(
              name: 'Refundable',
              detail: transaction.refundable ? 'YES' : 'NO',
              detailColor: transaction.refundable ? kYesColor : kNoColor,
            ),
            CustomBookingDetails(
              name: 'VAT',
              detail: '${transaction.vat * 100}%',
              detailColor: kBlackColor,
            ),
            CustomBookingDetails(
              name: 'Price',
              detail: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(
                transaction.price,
              ),
              detailColor: kBlackColor,
            ),
            CustomBookingDetails(
              name: 'Grand Total',
              detail: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(
                transaction.grandTotal,
              ),
              detailColor: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
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
                  Text(
                    'Payment',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        // NOTE: pay button
                        Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(defaultBorder),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/image_card.png',
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/icon_plane.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
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
                                  state.user.balance,
                                ),
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Current Balance',
                                style: primaryTextStyle.copyWith(
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: kNoColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            buttonName: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            buttonMargin: EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Text(
          'Terms and Conditions',
          style: primaryTextStyle.copyWith(
            color: kGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
    );
  }
}
