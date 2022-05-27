// import 'dart:js';

import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:bwa_airplane/logics/cubit/page_cubit.dart';
import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kNoColor,
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
            child: CustomButton(
          buttonName: 'Sign Out',
          buttonWidth: 220,
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
        ));
      },
    );
  }
}
