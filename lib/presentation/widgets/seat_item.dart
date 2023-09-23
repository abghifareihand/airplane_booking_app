import 'package:airplane_booking_app/common/constants.dart';
import 'package:airplane_booking_app/presentation/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItem({
    super.key,
    required this.id,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

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
          color: !isAvailable
              ? kUnavailableColor
              : isSelected
                  ? kPrimaryColor
                  : kAvailableColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 2,
              color: !isAvailable ? kUnavailableColor : kPrimaryColor),
        ),
        child: Center(
          child: Text(
            id,
            style: isSelected
                ? whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  )
                : whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
          ),
        ),
      ),
    );
  }
}
