import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sriwijaya/cubit/transaction_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/widgets/card_transaction.dart';
import 'package:sriwijaya/ui/widgets/destination_tile.dart';

class Transaction extends HookWidget {
  const Transaction(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<TransactionCubit>().getTransactions(userId);
      return null;
    }, []);
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kRedColor,
          ));
        }
      },
      builder: (context, state) {
        if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text("There's no any transaction yet."),
            );
          }
          return Container(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 70,
            ),
            child: ListView(
              children: state.transactions.map((e) {
                return CardTransaction(
                  transactionId: e.id,
                  grandTotal: e.grandTotal,
                  tile: DestinationTile(
                    destination: e.destination,
                    margin: EdgeInsets.zero,
                  ),
                  amountOfTraveler: e.amountOfTraveler,
                  date: e.date,
                );
              }).toList(),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
