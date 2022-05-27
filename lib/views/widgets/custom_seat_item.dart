import 'package:bwa_airplane/logics/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../preferences/theme.dart';

class CustomSeatItem extends StatelessWidget {
  // NOTE: 0 -> Available, 1 -> Selected, 2 -> Unavailable

  final String id;
  final bool isAvailable;
  const CustomSeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (!isSelected) {
          return kAvailableColor;
        } else {
          return kPrimaryColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    childText() {
      if (!isSelected) {
        return '';
      } else {
        return 'YOU';
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
          ),
        ),
        child: Center(
          child: Text(
            childText(),
            style: primaryTextStyle.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
