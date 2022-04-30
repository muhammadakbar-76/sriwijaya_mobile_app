import 'package:firebase_core/firebase_core.dart';
import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/cubit/destination_cubit.dart';
import 'package:sriwijaya/cubit/page_cubit.dart';
import 'package:sriwijaya/cubit/payment_cubit.dart';
import 'package:sriwijaya/cubit/seat_cubit.dart';
import 'package:sriwijaya/cubit/transaction_cubit.dart';
import 'package:sriwijaya/ui/pages/bonus.dart';
import 'package:sriwijaya/ui/pages/get_started.dart';
import 'package:sriwijaya/ui/pages/main_page.dart';
import 'package:sriwijaya/ui/pages/sign_in.dart';
import 'package:sriwijaya/ui/pages/sign_up.dart';
import 'package:sriwijaya/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStarted(),
          '/sign-up': (context) => SignUp(),
          '/sign-in': (context) => SignIn(),
          '/bonus': (context) => const Bonus(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
