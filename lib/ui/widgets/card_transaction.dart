import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/widgets/destination_tile.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction(
      {Key? key,
      required this.transactionId,
      required this.grandTotal,
      required this.tile,
      required this.amountOfTraveler,
      required this.date})
      : super(key: key);

  final String transactionId;

  final double grandTotal;

  final DestinationTile tile;

  final int amountOfTraveler;

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderDefault),
        color: kWhiteColor,
        shadowColor: kBlackColor,
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${amountOfTraveler.toString()} person",
                      style: grayTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "ID : $transactionId",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Grand Total :    ${NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(grandTotal)}",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(70, 96, 98, 169)),
                  borderRadius: borderDefault,
                ),
                child: tile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
