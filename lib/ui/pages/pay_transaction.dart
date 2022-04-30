import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/cubit/destination_cubit.dart';
import 'package:sriwijaya/cubit/payment_cubit.dart';
import 'package:sriwijaya/cubit/seat_cubit.dart';
import 'package:sriwijaya/cubit/transaction_cubit.dart';
import 'package:sriwijaya/models/transaction_model.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/pages/checkout.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:sriwijaya/ui/widgets/wallet_card.dart';

class PayTransaction extends HookWidget {
  const PayTransaction({
    Key? key,
    required this.transaction,
    required this.id,
    required this.balance,
    required this.name,
    required this.reservedSeat,
  }) : super(key: key);

  final String id;

  final List<dynamic> reservedSeat;

  final TransactionModel transaction;

  final int balance;

  final String name;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<PaymentCubit>().setInit();
      return null;
    }, []);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ));
          } else if (state is PaymentSuccess) {
            context.read<AuthCubit>().reloadUser(state.user);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Checkout(
                    transaction: TransactionModel(
                      destination: transaction.destination,
                      userId: transaction.userId,
                      amountOfTraveler: transaction.amountOfTraveler,
                      selectedSeat: transaction.selectedSeat,
                      insurance: transaction.insurance,
                      refundable: transaction.refundable,
                      vat: transaction.vat,
                      price: transaction.price,
                      grandTotal: transaction.grandTotal,
                      lunas: true,
                    ),
                    user: state.user,
                    reservedSeat: reservedSeat,
                  ),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WalletCard(
                  name: name,
                  balance: balance,
                ),
                const SizedBox(height: 30),
                Text(
                  "Payment Details",
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Old Balance : ",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: "IDR ",
                        decimalDigits: 0,
                      ).format(balance),
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Payment : ",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: "IDR ",
                        decimalDigits: 0,
                      ).format(transaction.grandTotal),
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New Balance : ",
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: "IDR ",
                        decimalDigits: 0,
                      ).format(balance - transaction.grandTotal),
                      style: blackTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        textButton: "Pay Now",
                        eventFunc: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Lakukan Pembayaran?"),
                              content: const Text(
                                  "Saldo anda akan dikurangi sesuai tagihan"),
                              actions: [
                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () =>
                                      Navigator.pop(context, "Cancel"),
                                ),
                                TextButton(
                                    child: const Text("Ok"),
                                    onPressed: () async {
                                      Navigator.pop(context, "Ok");
                                      context.read<PaymentCubit>().setLoading();
                                      var selectedSeat =
                                          List.from(reservedSeat);
                                      selectedSeat.addAll(
                                          transaction.selectedSeat.split(","));
                                      context.read<SeatCubit>().setInit();
                                      context
                                          .read<DestinationCubit>()
                                          .reserveSeat(
                                            destinationId:
                                                transaction.destination.id,
                                            seats: selectedSeat,
                                          );
                                      context
                                          .read<TransactionCubit>()
                                          .sendTransaction(transaction);
                                      context
                                          .read<PaymentCubit>()
                                          .updateBalance(
                                            id: id,
                                            newBalance: (balance -
                                                    transaction.grandTotal)
                                                .toInt(),
                                          );
                                    }),
                              ],
                            ),
                          );
                        },
                        width: 220,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
