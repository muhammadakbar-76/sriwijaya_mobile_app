import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/ui/widgets/wallet_card.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: WalletCard(
              name: state.user.name,
              balance: state.user.balance,
            ),
          );
        }
        return const Center(
          child: SizedBox(),
        );
      },
    );
  }
}
