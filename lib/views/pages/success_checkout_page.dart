import 'package:bwa_airplane/logics/cubit/page_cubit.dart';
import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 150,
            margin: EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image_booked.png'),
              ),
            ),
          ),
          Text(
            'Well Booked 😍',
            style: primaryTextStyle.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Are you ready to explore the new\nworld of experiences?',
            style: primaryTextStyle.copyWith(
              color: kGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          CustomButton(
            buttonName: 'My Bookings',
            onPressed: () {
              context.read<PageCubit>().setPage(1);
              // biar gak bisa back ke halaman ini lagi setelah pindah
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            },
            buttonWidth: 220,
            buttonMargin: EdgeInsets.only(top: 50),
          ),
        ],
      )),
    );
  }
}
