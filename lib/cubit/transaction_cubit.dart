import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sriwijaya/models/transaction_model.dart';
import 'package:sriwijaya/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void sendTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().sendTransaction(transaction);
      emit(const TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void getTransactions(String userId) async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().getTransaction(userId);
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
