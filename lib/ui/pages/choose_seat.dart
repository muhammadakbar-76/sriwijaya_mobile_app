import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/cubit/seat_cubit.dart';
import 'package:sriwijaya/models/destination_model.dart';
import 'package:sriwijaya/models/transaction_model.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/pages/checkout.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:sriwijaya/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeat extends StatelessWidget {
  const ChooseSeat(this.destination, {Key? key}) : super(key: key);

  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: borderDefault,
          color: kWhiteColor,
        ),
        child: BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //seat indicator
                  children: [
                    SizedBox(
                      height: 28,
                      width: 48,
                      child: Center(
                        child: Text(
                          "A",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      width: 48,
                      child: Center(
                        child: Text(
                          "B",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      width: 48,
                      child: Center(
                        child: Text(
                          "",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      width: 48,
                      child: Center(
                        child: Text(
                          "C",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28,
                      width: 48,
                      child: Center(
                        child: Text(
                          "D",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("A1")
                          ? false
                          : true,
                      id: "A1",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("B1")
                          ? false
                          : true,
                      id: "B1",
                    ),
                    Container(
                      height: 28,
                      width: 48,
                      margin: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          "1",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("C1")
                          ? false
                          : true,
                      id: "C1",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("D1")
                          ? false
                          : true,
                      id: "D1",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("A2")
                          ? false
                          : true,
                      id: "A2",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("B2")
                          ? false
                          : true,
                      id: "B2",
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      margin: const EdgeInsets.only(top: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "2",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("C2")
                          ? false
                          : true,
                      id: "C2",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("D2")
                          ? false
                          : true,
                      id: "D2",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("A3")
                          ? false
                          : true,
                      id: "A3",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("B3")
                          ? false
                          : true,
                      id: "B3",
                    ),
                    Container(
                      height: 28,
                      width: 48,
                      margin: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          "3",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("C3")
                          ? false
                          : true,
                      id: "C3",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("D3")
                          ? false
                          : true,
                      id: "D3",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("A4")
                          ? false
                          : true,
                      id: "A4",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("B4")
                          ? false
                          : true,
                      id: "AB",
                    ),
                    Container(
                      height: 28,
                      width: 48,
                      margin: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          "4",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("C4")
                          ? false
                          : true,
                      id: "C4",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("D4")
                          ? false
                          : true,
                      id: "D4",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("A5")
                          ? false
                          : true,
                      id: "A5",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("B5")
                          ? false
                          : true,
                      id: "B5",
                    ),
                    Container(
                      height: 28,
                      width: 48,
                      margin: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Text(
                          "5",
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("C5")
                          ? false
                          : true,
                      id: "C5",
                    ),
                    SeatItem(
                      isAvailable: destination.reservedSeat.contains("D5")
                          ? false
                          : true,
                      id: "D5",
                    ),
                  ],
                ),
                //* Your Seat
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Seat",
                        style: grayTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(","),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                //* Total
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: grayTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: "id", decimalDigits: 0, symbol: "IDR ")
                            .format(destination.price * state.length),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon_available.png"),
                ),
              ),
            ),
            Text(
              "Available",
              style: blackTextStyle,
            ),
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon_selected.png"),
                ),
              ),
            ),
            Text(
              "Selected",
              style: blackTextStyle,
            ),
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon_unavailable.png"),
                ),
              ),
            ),
            Text(
              "Unavailable",
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: [
                title(),
                seatStatus(),
                selectSeat(),
                CustomButton(
                  disable: context.watch<SeatCubit>().state.isNotEmpty
                      ? false
                      : true,
                  textButton: "Continue to Checkout",
                  eventFunc: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Checkout(
                          transaction: TransactionModel(
                            userId: state.user.id,
                            destination: destination,
                            amountOfTraveler:
                                context.read<SeatCubit>().state.length,
                            selectedSeat:
                                context.read<SeatCubit>().state.join(","),
                            vat: 0.45,
                            insurance: true,
                            price: destination.price,
                            grandTotal: destination.price *
                                    context.read<SeatCubit>().state.length +
                                0.45 * destination.price,
                          ),
                          user: state.user,
                          reservedSeat: destination.reservedSeat,
                        ),
                      ),
                    );
                  },
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 46,
                  ),
                )
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
