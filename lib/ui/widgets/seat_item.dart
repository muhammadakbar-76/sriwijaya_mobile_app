import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sriwijaya/cubit/seat_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    Key? key,
    this.isAvailable = false,
    required this.id,
  }) : super(key: key);

  final String id;

  final bool isAvailable;

  Color getColor(bool isSelected) {
    if (!isAvailable) return kUnavailableColor;
    if (isSelected) return kPrimaryColor;
    return kAvailableColor;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (isAvailable) {
              context.read<SeatCubit>().selectSeat(id);
            }
          },
          child: Container(
            height: 48,
            width: 48,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: getColor(state.contains(id)),
              borderRadius: borderDefault,
              border: isAvailable
                  ? Border.all(
                      color: kPrimaryColor,
                      width: 2,
                    )
                  : Border.all(color: Colors.transparent),
            ),
            child: Center(
              child: Text(
                "YOU",
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                  color: state.contains(id) ? Colors.white : Colors.transparent,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
