import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logics/cubit/auth_cubit.dart';
import '../../preferences/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return Container(
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
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthSuccess) {
                            return Text(
                              '${state.user.name}',
                              style: primaryTextStyle.copyWith(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          }
                          return SizedBox();
                        },
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
                      'IDR 200.000.000',
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
      );
    }

    Widget title() {
      return Text(
        'Big Bonus 🎉',
        style: primaryTextStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget subtitle() {
      return Text(
        'We give you early credit so that\nyou can buy a flight ticket',
        style: primaryTextStyle.copyWith(
          color: kGreyColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            SizedBox(height: 80),
            title(),
            SizedBox(height: 10),
            subtitle(),
            SizedBox(height: 50),
            CustomButton(
              buttonName: 'Start Fly Now',
              buttonWidth: 220,
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
