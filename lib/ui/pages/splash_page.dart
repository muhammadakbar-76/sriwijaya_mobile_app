import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Timer(const Duration(seconds: 3), (() {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/get-started", (route) => false);
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
        }
      }));
      return null;
    }, []);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                'assets/icon_plane.png',
              ))),
            ),
            Text(
              'SRIWIJAYA',
              style: whiteTextStyle.copyWith(
                  fontSize: 32, fontWeight: medium, letterSpacing: 10),
            )
          ],
        ),
      ),
    );
  }
}
