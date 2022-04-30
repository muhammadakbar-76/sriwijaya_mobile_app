import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:sriwijaya/shared/theme.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
    this.name = "",
    this.balance = 0,
  }) : super(key: key);

  final String name;

  final int balance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderDefault),
        color: kPrimaryColor,
        elevation: 20,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: whiteTextStyle.copyWith(fontWeight: light),
                    ),
                    Text(
                      name,
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )),
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_plane.png'))),
                ),
                Text('Pay',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium)),
              ]),
              const SizedBox(height: 41),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id",
                      symbol: "IDR ",
                      decimalDigits: 0,
                    ).format(balance),
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
