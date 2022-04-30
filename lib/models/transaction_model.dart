import 'package:equatable/equatable.dart';

import 'destination_model.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;

  final int amountOfTraveler;

  final String selectedSeat;

  final bool insurance;

  final bool refundable;

  final double vat;

  final int price;

  final double grandTotal;

  final String userId;

  final String id;

  final bool lunas;

  final String date;

  const TransactionModel({
    required this.destination,
    required this.userId,
    this.id = "",
    this.amountOfTraveler = 0,
    this.selectedSeat = "",
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.lunas = false,
    this.date = "",
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      destination: DestinationModel.fromJson(
          json["destination"]["id"], json["destination"]),
      userId: json["userId"],
      id: id,
      amountOfTraveler: json["amountOfTraveler"],
      selectedSeat: json["selectedSeat"],
      insurance: json["insurance"],
      refundable: json["refundable"],
      vat: json["vat"],
      price: json["price"],
      grandTotal: json["grandTotal"],
      date: json["date"],
    );
  }

  @override
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        selectedSeat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
        date,
      ];
}
