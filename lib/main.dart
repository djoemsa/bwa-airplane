import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:bwa_airplane/logics/cubit/destination_cubit.dart';
import 'package:bwa_airplane/logics/cubit/seat_cubit.dart';
import 'package:bwa_airplane/logics/cubit/transaction_cubit.dart';
import 'package:bwa_airplane/views/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'logics/cubit/page_cubit.dart';
import 'views/pages/bonus_page.dart';
import 'views/pages/get_started_page.dart';
import 'views/pages/main_page.dart';
import 'views/pages/sign_in_pages.dart';
import 'views/pages/sign_up_pages.dart';
import 'views/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
