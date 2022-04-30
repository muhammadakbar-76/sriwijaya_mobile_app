import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sriwijaya/ui/widgets/wallet_card.dart';

class Bonus extends StatelessWidget {
  const Bonus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return WalletCard(
              name: state.user.name,
              balance: state.user.balance,
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus🎉',
          style: blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'we give you early credit so that\nyou can buy a flight ticket',
          style: grayTextStyle.copyWith(fontSize: 16, fontWeight: light),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startFlightButton() {
      return CustomButton(
        textButton: 'Start Fly Now',
        eventFunc: () {
          Navigator.pushNamed(context, '/main');
        },
        width: 220,
        margin: const EdgeInsets.only(top: 50),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subTitle(),
            startFlightButton(),
          ],
        ),
      ),
    );
  }
}
