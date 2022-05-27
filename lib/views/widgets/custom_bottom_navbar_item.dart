import 'package:bwa_airplane/logics/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';

class CustomNavBarItem extends StatelessWidget {
  final int index;
  final String assetsURL;
  const CustomNavBarItem({
    Key? key,
    required this.index,
    required this.assetsURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            assetsURL,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparent,
              borderRadius: BorderRadius.circular(
                defaultBorder,
              ),
            ),
          )
        ],
      ),
    );
  }
}
