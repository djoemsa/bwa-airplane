import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../preferences/theme.dart';
import 'custom_booking_details_item.dart';

class CustomTransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const CustomTransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
