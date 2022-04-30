import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sriwijaya/cubit/page_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                margin: const EdgeInsets.only(bottom: 80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image_success.png"),
                  ),
                ),
              ),
              Text(
                "Well Booked 😍",
                style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Are you ready to explore the new\nworld of experiences?",
                style: grayTextStyle.copyWith(fontSize: 16, fontWeight: light),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                textButton: "My Bookings",
                eventFunc: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/main", (route) => false);
                },
                margin: const EdgeInsets.only(top: 50),
                width: 220,
              )
            ],
          ),
        ));
  }
}
