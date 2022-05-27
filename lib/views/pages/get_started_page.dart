import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/image_get_started.png'),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: primaryTextStyle.copyWith(
                    color: kWhiteColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore new world with us and let \nyourself get an amazing experiences',
                  style: primaryTextStyle.copyWith(
                    color: kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  buttonName: 'Get Started',
                  buttonWidth: 220,
                  buttonMargin: EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/sign-up'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
