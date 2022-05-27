import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../preferences/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/image_card.png',
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      offset: Offset(0, 10),
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: primaryTextStyle.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '${state.user.name}',
                              style: primaryTextStyle.copyWith(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icons/icon_plane.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Pay',
                        style: primaryTextStyle.copyWith(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 41),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance',
                            style: primaryTextStyle.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              state.user.balance,
                            ),
                            style: primaryTextStyle.copyWith(
                              fontSize: 26,
                              color: kWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
