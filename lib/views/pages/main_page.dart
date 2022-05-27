import 'package:bwa_airplane/logics/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';

import '../widgets/custom_bottom_navbar_item.dart';
import 'home_page.dart';
import 'transactions_page.dart';
import 'wallet_page.dart';
import 'settings_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.fromLTRB(
            defaultMargin,
            0,
            defaultMargin,
            30,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomNavBarItem(
                index: 0,
                assetsURL: 'assets/icons/icon_globe.png',
              ),
              CustomNavBarItem(
                index: 1,
                assetsURL: 'assets/icons/icon_book.png',
              ),
              CustomNavBarItem(
                index: 2,
                assetsURL: 'assets/icons/icon_credit.png',
              ),
              CustomNavBarItem(
                index: 3,
                assetsURL: 'assets/icons/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(state),
              customBottomNavBar(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.zero,
                    height: 30,
                    width: double.infinity,
                    color: kBackgroundColor,
                  ))
            ],
          ),
        );
      },
    );
  }
}
