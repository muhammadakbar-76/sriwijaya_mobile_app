part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final UserModel user;

  const PaymentSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class PaymentFailed extends PaymentState {
  final String error;

  const PaymentFailed(this.error);

  @override
  List<Object> get props => [error];
}

class PaymentLoading extends PaymentState {}
