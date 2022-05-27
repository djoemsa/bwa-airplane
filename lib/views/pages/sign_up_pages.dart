import 'package:bwa_airplane/logics/cubit/auth_cubit.dart';
import 'package:bwa_airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';
import '../widgets/custom_textformfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
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
            CustomTextFormField(
              controller: nameController,
              formDesc: 'Full Name',
              formHint: 'Insert your full name here',
            ),
            CustomTextFormField(
              controller: emailController,
              formDesc: 'Email Address',
              formHint: 'Insert your email address here',
            ),
            CustomTextFormField(
              controller: passwordController,
              formDesc: 'Password',
              formHint: 'Insert your password here',
              obscure: true,
            ),
            CustomTextFormField(
              controller: hobbyController,
              formDesc: 'Hobby',
              formHint: 'Insert your hobby here',
            ),
          ],
        ),
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // NOTE: listener => invoke something once
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/bonus', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kNoColor,
            ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            buttonName: 'Get Started',
            onPressed: () => context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  hobby: hobbyController.text,
                ),
          );
        },
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/sign-in'),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Have an account? Sign in',
            style: primaryTextStyle.copyWith(
              color: kGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
            submitButton(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
