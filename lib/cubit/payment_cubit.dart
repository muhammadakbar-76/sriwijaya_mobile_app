import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sriwijaya/models/user_model.dart';
import 'package:sriwijaya/services/user_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  void setInit() {
    emit(PaymentInitial());
  }

  void setLoading() {
    emit(PaymentLoading());
  }

  void updateBalance({
    required String id,
    required int newBalance,
  }) async {
    try {
      emit(PaymentLoading());
      UserModel user = await UserService().updateBalance(id, newBalance);
      emit(PaymentSuccess(user));
    } catch (e) {
      emit(PaymentFailed(e.toString()));
    }
  }
}
