import 'package:bwa_airplane/logics/cubit/seat_cubit.dart';
import 'package:bwa_airplane/models/destination_model.dart';
import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:bwa_airplane/views/pages/checkout_page.dart';
import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:bwa_airplane/views/widgets/custom_seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../preferences/theme.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget seatStatusDesc() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // NOTE: available
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_available.png',
                  ),
                ),
              ),
            ),
            Text(
              'Available',
              style: primaryTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_selected.png',
                  ),
                ),
              ),
            ),
            Text(
              'Selected',
              style: primaryTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/icon_unavailable.png',
                  ),
                ),
              ),
            ),
            Text(
              'Unavailable',
              style: primaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultBorder,
          ),
        ),
        child: Column(
          children: [
            // NOTE: seat indications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'A',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'B',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      ' ',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'C',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'D',
                      style: primaryTextStyle.copyWith(
                        color: kGreyColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // NOTE: seat 1st row
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSeatItem(
                    id: 'A1',
                  ),
                  CustomSeatItem(
                    id: 'B1',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '1',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  CustomSeatItem(
                    id: 'C1',
                  ),
                  CustomSeatItem(
                    id: 'D1',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSeatItem(
                    id: 'A2',
                  ),
                  CustomSeatItem(
                    id: 'B2',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '2',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  CustomSeatItem(
                    id: 'C2',
                  ),
                  CustomSeatItem(
                    id: 'D2',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSeatItem(
                    id: 'A3',
                  ),
                  CustomSeatItem(
                    isAvailable: false,
                    id: 'B3',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '3',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  CustomSeatItem(
                    id: 'C3',
                  ),
                  CustomSeatItem(
                    id: 'D3',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSeatItem(
                    id: 'A4',
                  ),
                  CustomSeatItem(
                    id: 'B4',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '4',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  CustomSeatItem(
                    isAvailable: false,
                    id: 'C4',
                  ),
                  CustomSeatItem(
                    id: 'D4',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSeatItem(
                    id: 'A5',
                  ),
                  CustomSeatItem(
                    id: 'B5',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '5',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  CustomSeatItem(
                    isAvailable: false,
                    id: 'C5',
                  ),
                  CustomSeatItem(
                    isAvailable: false,
                    id: 'D5',
                  ),
                ],
              ),
            ),
            // NOTE: selected seat/s information/confirmation
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          state.join(', '),
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            // NOTE: total
            BlocBuilder<SeatCubit, List<String>>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: primaryTextStyle.copyWith(
                          color: kGreyColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(
                          state.length * destination.price,
                        ),
                        style: primaryTextStyle.copyWith(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            buttonName: 'Continue to Checkout',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => CheckoutPage(TransactionModel(
                        destination: destination,
                        amountOfTraveler: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: destination.price * state.length,
                        grandTotal:
                            (destination.price * state.length * 1.45).toInt(),
                      ))),
                ),
              );
            },
            buttonMargin: EdgeInsets.only(
              top: 30,
              bottom: 46,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          seatStatusDesc(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
