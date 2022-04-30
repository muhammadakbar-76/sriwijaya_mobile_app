import 'package:intl/intl.dart';
import 'package:sriwijaya/models/user_model.dart';
import 'package:sriwijaya/ui/pages/pay_transaction.dart';
import 'package:sriwijaya/ui/pages/success_checkout.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:sriwijaya/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';
import '../../shared/theme.dart';

class Checkout extends StatelessWidget {
  const Checkout({
    Key? key,
    required this.transaction,
    required this.user,
    required this.reservedSeat,
  }) : super(key: key);

  final TransactionModel transaction;

  final UserModel user;

  final List<dynamic> reservedSeat;

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              height: 65,
              width: 291,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image_checkout.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: 322,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CGK",
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "Tangerang",
                        style: grayTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TLC",
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        "Ciliwung",
                        style: grayTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget paymentItem({
      String name = "",
      String item = "",
      bool status = false,
    }) {
      TextStyle getColor() {
        switch (name) {
          case "Insurance":
            return greenTextStyle.copyWith(
              fontWeight: semiBold,
              color: status ? kGreenColor : kRedColor,
            );
          case "Refundable":
            return redTextStyle.copyWith(
              fontWeight: semiBold,
              color: status ? kGreenColor : kRedColor,
            );
          case "Grand Total":
            return purpleTextStyle.copyWith(
              fontWeight: semiBold,
            );
          default:
            return blackTextStyle.copyWith(
              fontWeight: semiBold,
            );
        }
      }

      String getItem() {
        if (name != "Insurance" && name != "Refundable") return item;
        return status ? "YES" : "NO";
      }

      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon_check.png"),
                ),
              ),
            ),
            Text(
              name,
              style: blackTextStyle,
            ),
            const Spacer(),
            Text(
              getItem(),
              style: getColor(),
            )
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            paymentItem(
                name: "Traveler",
                item: "${transaction.amountOfTraveler} person"),
            paymentItem(name: "Seat", item: transaction.selectedSeat),
            paymentItem(
              name: "Insurance",
              status: transaction.insurance,
            ),
            paymentItem(
              name: "Refundable",
              status: transaction.refundable,
            ),
            paymentItem(
                name: "VAT", item: "${(transaction.vat * 100).toInt()}%"),
            paymentItem(
              name: "Price",
              item: NumberFormat.currency(
                locale: "id",
                symbol: "IDR ",
                decimalDigits: 0,
              ).format(transaction.price),
            ),
            paymentItem(
                name: "Grand Total",
                item: NumberFormat.currency(
                  locale: "id",
                  symbol: "IDR ",
                  decimalDigits: 0,
                ).format(transaction.grandTotal)),
          ],
        ),
      );
    }

    Widget bookingDetail() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: borderDefault,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DestinationTile(
              destination: transaction.destination,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
            ),
            paymentDetails(),
          ],
        ),
      );
    }

    Widget pay() {
      return Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: borderDefault,
        ),
        margin: const EdgeInsets.symmetric(vertical: 30),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Details",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 70,
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      transaction.lunas
                          ? null
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PayTransaction(
                                  transaction: transaction,
                                  id: user.id,
                                  balance: user.balance,
                                  name: user.name,
                                  reservedSeat: reservedSeat,
                                ),
                              ),
                            );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon_plane.png"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Pay",
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          transaction.lunas ? kGreyColor : kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: borderDefault,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: "IDR ",
                        decimalDigits: 0,
                      ).format(user.balance),
                      style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Current Balance",
                      style: grayTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget payNowButton() {
      return CustomButton(
        textButton: "Continue",
        eventFunc: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SuccessCheckout()),
              (route) => false);
        },
        margin: const EdgeInsets.symmetric(vertical: 30),
        disable: transaction.lunas ? false : true,
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetail(),
          pay(),
          payNowButton(),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Text(
              "Terms & Condition",
              style: grayTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
