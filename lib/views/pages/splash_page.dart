import 'dart:async';
// import 'dart:html';

import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        User? user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/get-started');
        },
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/icon_plane.png'),
                ),
              ),
            ),
            Text(
              ' AIRPLANE',
              style: primaryTextStyle.copyWith(
                  color: kWhiteColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 10),
            )
          ],
        )),
      ),
    );
  }
}
