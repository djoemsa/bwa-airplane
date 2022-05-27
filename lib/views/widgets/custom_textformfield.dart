import 'package:flutter/material.dart';
import '../../preferences/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String formDesc;
  final String formHint;
  final bool obscure;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.formDesc,
    required this.formHint,
    this.obscure = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(formDesc),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: obscure,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: formHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultBorder,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
