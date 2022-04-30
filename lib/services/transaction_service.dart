import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:sriwijaya/models/transaction_model.dart';

class TransactionService {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection("transaction");

  Future<void> sendTransaction(TransactionModel transaction) async {
    try {
      await _transactionReference.add({
        "userId": transaction.userId,
        "destination": transaction.destination.toJson(),
        "amountOfTraveler": transaction.amountOfTraveler,
        "selectedSeat": transaction.selectedSeat,
        "insurance": transaction.insurance,
        "refundable": transaction.refundable,
        "vat": transaction.vat,
        "price": transaction.price,
        "grandTotal": transaction.grandTotal,
        "date": DateFormat("dd-mm-yyyy").format(DateTime.now()),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransaction(String userId) async {
    try {
      QuerySnapshot result =
          await _transactionReference.where('userId', isEqualTo: userId).get();

      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
