import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/pages/home_page.dart';
import 'package:sriwijaya/ui/pages/settings.dart';
import 'package:sriwijaya/ui/pages/transaction.dart';
import 'package:sriwijaya/ui/pages/wallet.dart';
import 'package:sriwijaya/ui/widgets/custom_button_navigation_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/page_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 1:
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Transaction(state.user.id);
              }
              return const SizedBox();
            },
          );
        case 2:
          return const Wallet();
        case 3:
          return const SettingsPage();
        default:
          return const HomePage();
      }
    }

    Widget customButtomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 10,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration:
              BoxDecoration(color: kWhiteColor, borderRadius: borderDefault),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomButtonNavigation(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomButtonNavigation(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomButtonNavigation(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomButtonNavigation(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              children: [
                buildContent(state),
                customButtomNavigation(),
              ],
            ));
      },
    );
  }
}
