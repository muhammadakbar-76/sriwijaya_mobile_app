import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(
                top: 30, left: defaultMargin, right: defaultMargin),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Howdy,\n${state.user.name}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis)),
                      const SizedBox(height: 6),
                      Text(
                        "Where to fly today?",
                        style: grayTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/image_profile.png')),
                      borderRadius: BorderRadius.circular(30)),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
